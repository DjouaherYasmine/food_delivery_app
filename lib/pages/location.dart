import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class locate extends StatefulWidget {
  const locate({super.key});

  @override
  _locateState createState() => _locateState();
}

class _locateState extends State<locate> {
  String local ="";
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  LatLng? _center;
  final String mapboxAccessToken = 'pk.eyJ1IjoieWFzbWluZWRqIiwiYSI6ImNseHA3d3FyYzBqa2QyanNlajI0anVjODgifQ.jX9qTlos1doSzdtDWdG6xQ';
  List<LatLng> _markers = [];
  final MapController _mapController = MapController();

  Future<List<String>> _getSuggestions(String query) async {
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => item['display_name'] as String).toList();
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  Future<void> _searchPlaces(String query) async {
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      if (data.isNotEmpty) {
        setState(() {
          _markers.clear();
          for (var item in data) {
            final lat = double.parse(item['lat']);
            final lon = double.parse(item['lon']);
            _markers.add(LatLng(lat, lon));
          }
          _center = _markers.first;
          _mapController.move(_center!, 17); // Center the map on the new marker
        });
      }
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _center ?? LatLng(51.509364, -0.128928),
              initialZoom: 17,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/256/{z}/{x}/{y}@2x?access_token=$mapboxAccessToken',
                additionalOptions: {
                  'access_token': mapboxAccessToken,
                },
                userAgentPackageName: 'com.example.app',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    '© Mapbox © OpenStreetMap',
                    onTap: () => launchUrl(Uri.parse('https://www.mapbox.com/about/maps/')),
                  ),
                ],
              ),
              if (_center != null)
                MarkerLayer(
                  markers: [
                    Marker(point: _center!, child: const Icon(
                      Icons.location_on,
                      color: Color(0xFF068246),
                      size: 40.0,
                    ),)

                  ],
                ),
              if (_center != null)
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: _center!,
                      color: const Color(0xFF068246).withOpacity(0.1),
                      radius: 100, // Radius in meters
                    ),
                  ],
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  height: 69,
                  width: 342,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/search.svg"),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TypeAheadField<String>(
                            suggestionsCallback: (pattern) async {
                              return await _getSuggestions(pattern);
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            onSelected: (suggestion) {
                              _searchController.text = suggestion;
                              local =_searchController.text;
                              _searchPlaces(suggestion);
                            },
                            builder: (context, controller, focusNode) {
                              controller.text =_searchController.text;
                              return TextField(
                                controller: controller,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Find your location',
                                  hintStyle: GoogleFonts.roboto(color: Color(0xFFDA6317), fontSize : 12),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(), // Placeholder to push the map to the bottom
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 147,
                width: 342,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      offset: Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/pin.svg"),
                          const SizedBox(width: 10,),
                          Flexible(
                            child: Text(
                              local,
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const login()),
                        );
                      },
                      child: Container(
                        height: 57,
                        width: 322,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Set location",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
