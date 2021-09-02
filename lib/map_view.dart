import 'package:best_flutter_ui_templates/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/hotel_list_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
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
