import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/google_maps/directions_model.dart';
import 'package:http/http.dart' as http;

class DirectionsService {
  Future<Directions> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {

    final url = Uri.https('https://maps.googleapis.com',
    '/maps/api/directions/json?origin=${origin.latitude},${origin
        .longitude}&destination=${destination.latitude},${destination.
    longitude}&key=$googleApiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
    String date = response.body;
    final decodeData = jsonDecode(date);
    return Directions.fromMap(decodeData);
    }
    return
    null;
  }
}
