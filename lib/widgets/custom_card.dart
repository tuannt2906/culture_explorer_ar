import 'package:flutter/material.dart';
import 'custom_marker.dart';

class CustomCard extends StatelessWidget {
  final CustomMarker marker;
  const CustomCard({
    super.key,
    required this.marker,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => {},
        child: Icon(
            marker.type == 'museum'
                ? Icons.museum_outlined
                : Icons.palette_outlined,
            size: 40,
            ),
      ),
    );
  }
}
