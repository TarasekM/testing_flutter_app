import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";
import 'package:location/location.dart';

class OpenMapsWidget extends StatefulWidget {
  final LocationData _locationData;

  const OpenMapsWidget(this._locationData);

  @override
  _OpenMapsWidget createState() => _OpenMapsWidget();
}

class _OpenMapsWidget extends State<OpenMapsWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
          center: LatLng(widget._locationData.latitude, widget._locationData.longitude),
          zoom: 10,
        ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(widget._locationData.latitude, widget._locationData.longitude),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

