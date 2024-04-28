import 'package:culture_explorer_ar/overpass/place_model.dart';
import 'package:culture_explorer_ar/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MarkerNotifier with ChangeNotifier {
  List<CustomMarker> _markerList = [];
  List<CustomMarker> get markerList => List.unmodifiable(_markerList);

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  void createMarkers(List<Place> places) {
    _markerList = places
        .map((place) => CustomMarker(
            point: place.position,
            name: place.tags.name,
            nameEn: place.tags.nameEn,
            type: place.tags.tourism))
        .toList();
    notifyListeners();
  }

  void resetSelection() {
    _isSelected = false;
    notifyListeners();
  }

  void changeSelection() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}

@immutable
class CustomMarker extends Marker {
  final String? name;
  final String? nameEn;
  final String type;

  CustomMarker(
      {required super.point,
      required this.name,
      required this.nameEn,
      required this.type})
      : super(
            rotate: true,
            child: CustomIconButton(name: name, nameEn: nameEn, type: type));
}
