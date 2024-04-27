import 'package:culture_explorer_ar/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

@immutable
class CustomMarker extends Marker {
  final String? name;
  final String? nameEn;
  final String type;

  CustomMarker(
      {this.name, this.nameEn, required super.point, required this.type})
      : super(rotate: true, child: CustomIconButton(type: type));
}
