// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gaz_mandob/Controller/ServicesProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class RealTimeTracking extends StatefulWidget {
  @override
  _RealTimeTrackingState createState() => _RealTimeTrackingState();
}

ApiService apiService = ApiService();

class _RealTimeTrackingState extends State<RealTimeTracking> {
  GoogleMapController? mapController;
  Map<int, Marker> markers = {};
  MandobLocationService? mandobLocationService =
      MandobLocationService(apiService);
  @override
  void initState() {
    super.initState();
    mandobLocationService!.startTracking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Tracking'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: markers.values.toSet(),
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0),
              zoom: 0,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("jkasdh"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ApiService {
  final String baseUrl = 'https://mayadeen-md.com/gaz/public/api';
  Future<void> updateLocation(double latitude, double longitude) async {
    log(ServicesProvider.gettoken());
    log(latitude.toString());
    log(longitude.toString());
    final response = await http.post(
      Uri.parse('$baseUrl/update-location'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
      },
      body: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      },
    );
    log(response.body);
  }
}

class MandobLocationService {
  final ApiService apiService;
  Timer? _timer;

  MandobLocationService(this.apiService);

  void startTracking() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      apiService.updateLocation(position.latitude, position.longitude);
    });
  }

  void stopTracking() {
    _timer?.cancel();
  }
}
