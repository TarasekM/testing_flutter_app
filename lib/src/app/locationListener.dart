import 'package:location/location.dart';


class LocationListener{
  Location _location;

  LocationListener(location){
    this._location = location;
  }

  Future<LocationData> getCurrentLocation() async {
    bool isServiceEnabled = await this._enableService();
    if(!isServiceEnabled){
      return null;
    }
    bool isPermissionGranted = await this._grantPermission();
    if(!isPermissionGranted){
      return null;
    }

    return await this._location.getLocation();
  }

  Future<bool> _enableService() async {
    bool serviceEnabled = await this._location.serviceEnabled();
    if(!serviceEnabled){
      serviceEnabled = await this._location.requestService();
    }
    if(!serviceEnabled){
      return false;
    }
    return true;
  }

  Future<bool> _grantPermission() async {
    PermissionStatus permissionGranted = await this._location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await this._location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}
