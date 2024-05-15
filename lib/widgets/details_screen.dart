import 'package:culture_explorer_ar/widgets/custom_marker.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final CustomMarker marker;

  const DetailsScreen({super.key, required this.marker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(marker.name),
      ),
      body: Container()
    );
  }
}