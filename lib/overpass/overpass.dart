import 'package:culture_explorer_ar/overpass/place_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Place>> fetchPlaces(String location) async {
  try {
    const endpoint = 'https://overpass-api.de/api/interpreter';
    final query =
        '[out:json][timeout:25];(nwr["tourism"="museum"]($location); nwr["tourism"="gallery"]($location); );out center;';

    final response = await http.post(Uri.parse(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: query);
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    final osmPlaces = decodedResponse['elements'] as Iterable<dynamic>? ?? [];
    List<Place> places = [];
    for (final element in osmPlaces) {
      try {
        places.add(Place.fromJson(element));
      } catch (error) {
        return [];
      }
    }
    return places;
  } catch (error) {
    return [];
  }
}

List<CircleMarker> placesToMarkerList(List<Place> places) {
  final markerList = places.map((place) => CircleMarker(
        point: place.position,
        radius: 100,
        useRadiusInMeter: true,
      ));
  return List<CircleMarker>.from(markerList);
}
