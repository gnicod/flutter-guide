import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapView extends StatelessWidget {
  static const String route = '/';

  MapboxMapController? mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: MapboxMap(
            onMapCreated: _onMapCreated,
            accessToken:
                "pk.eyJ1Ijoib3Zza2kzOSIsImEiOiJjazhpeXB5MzQwOTR1M3FxbG5lbjdwcnZhIn0.i6M7gn5any9lE9C_6sdW4g",
            initialCameraPosition:
                const CameraPosition(target: LatLng(0.0, 0.0)),
          )),
        ],
      ),
    );
  }
}
