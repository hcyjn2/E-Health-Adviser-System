import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:main_menu/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesService {
  final apiKey = 'AIzaSyAVN-cKkBDRSc2NKC5WdtIPmaMs3HR5reQ';

  Future<List<Place>> getPlaces(
      double latitude, double longitude, BitmapDescriptor icon) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&keyword=mental%20health&rankby=distance&key=$apiKey');
    var json = jsonDecode(response.body);
    var jsonResults = json['results'] as List;

    return jsonResults.map((place) => Place.fromJson(place, icon)).toList();
  }
}
