import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

@immutable
class CustomMarker extends Marker {
  final String? name;
  final String? nameEn;
  final String type;

  CustomMarker(
      {this.name, this.nameEn, required super.point, required this.type})
      : super(
          rotate: true,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => print("tapped"),
              child: type == "museum"
                  ? const Icon(Icons.museum)
                  : const Icon(Icons.palette),
            ),
          ),
        );
}
