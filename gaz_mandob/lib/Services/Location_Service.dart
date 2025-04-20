import 'dart:async';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:gaz_mandob/Controller/ServicesProvider.dart';

class ApiService {
  final String baseUrl = 'https://mayadeen-md.com/gaz/public/api';

  Future<void> updateLocation(double latitude, double longitude) async {
    log('Token: ${ServicesProvider.gettoken()}');
    log('Latitude: $latitude');
    log('Longitude: $longitude');
    try {
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
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
    } catch (e) {
      log('Error updating location: $e');
    }
  }
}

class MandobLocationService {
  final ApiService apiService;
  Timer? _timer;

  MandobLocationService(this.apiService);

  void startTracking() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 20), (timer) async {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        log('Position: ${position.latitude}, ${position.longitude}');
        apiService.updateLocation(position.latitude, position.longitude);
      } catch (e) {
        log('Error getting location: $e');
      }
    });
  }

  void stopTracking() {
    _timer?.cancel();
  }
}
