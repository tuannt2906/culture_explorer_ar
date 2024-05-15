import 'package:culture_explorer_ar/widgets/custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final CustomMarker marker;

  const DetailsScreen({super.key, required this.marker});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&destination=${marker.point.latitude},${marker.point.longitude}");
    return Scaffold(
        appBar: AppBar(
          title: Text(marker.name),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () => launchUrl(url),
                child: const Text("Direction")),
          ],
        ));
  }
}
