import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:testing_flutter_app/src/app/locationListener.dart';
import 'package:testing_flutter_app/src/views/home/maps.dart';


class CurrentLocationWidget extends StatefulWidget {
  final LocationListener _locationListener;
  CurrentLocationWidget(this._locationListener, {Key key}) : super(key: key);

  @override
  _CurrentLocationWidgetState createState () => _CurrentLocationWidgetState();
}


class _CurrentLocationWidgetState extends State<CurrentLocationWidget> {
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.all(32),
        child: FutureBuilder<LocationData>(
          future: widget._locationListener.getCurrentLocation(),
          builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot){
            Widget children;
            if(!snapshot.hasData) {
              children = Text('Location not specified.');
            } else{
              children = Column(
                children: [
                  Container(
                    child: OpenMapsWidget(snapshot.data),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: 200,
                        minHeight: 0,
                        minWidth: 0
                      ),
                  ),
                  Text('Your current location:'),
                  Text("Latitude: ${snapshot.data.latitude}, Longitude: ${snapshot.data.longitude}"),
                ],
              );
            }
            return children;
          },
        ),
    );
  }
}