import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'custom_popup.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 35, 38, 100),
      body: _buildMap(),
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Map".toUpperCase(),
        style: TextStyle(fontSize: 19.0, color: Colors.black87),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  LatLng _center = LatLng(40.762681, -73.832611);

  FlutterMap _buildMap() {
    return  FlutterMap(
        options: new MapOptions(
          minZoom: 15.0,
          center: _center,
          interactive: true,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate:
              'PASTE YOUR INTEGRATION URL HERE',
              additionalOptions: {
                'accessToken':
                'PASTE YOUR ACCESS TOKEN HERE',
                'id': 'PASTE YOUR MAPBOX ID HERE'
              }),
          new MarkerLayerOptions(markers: _buildMarkersOnMap()),
        ]);
  }

  List<Marker> _buildMarkersOnMap() {
    List<Marker> markers = List<Marker>();
    var marker = new Marker(
      point: _center,
      width: 279.0,
      height: 256.0,
      builder: (context) => GestureDetector(
          onTap: () {
            setState(() {
              if (key.currentState != null &&
                  (key.currentState as CustomPopupState).controller != null &&
                  (key.currentState as CustomPopupState).controller.value !=
                      null &&
                  (key.currentState as CustomPopupState)
                      .controller
                      .value
                      .isPlaying) {
                (key.currentState as CustomPopupState).controller.pause();
                (key.currentState as CustomPopupState).playerIcon =
                    Icons.play_arrow;
              }
              infoWindowVisible = !infoWindowVisible;
            });
          },
          child: _buildCustomMarker()),
    );
    markers.add(marker);

    return markers;
  }

  var infoWindowVisible = false;
  GlobalKey<State> key = new GlobalKey();

  Stack _buildCustomMarker() {
    return Stack(
      children: <Widget>[popup(), marker()],
    );
  }

  Opacity popup() {
    return Opacity(
      opacity: infoWindowVisible ? 1.0 : 0.0,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 279.0,
        height: 256.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_info_window.png"),
                fit: BoxFit.cover)),
        child: CustomPopup(key: key),
      ),
    );
  }

  Opacity marker() {
    return Opacity(
      child: Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/ic_marker.png',
            width: 49,
            height: 65,
          )),
      opacity: infoWindowVisible ? 0.0 : 1.0,
    );
  }
}
