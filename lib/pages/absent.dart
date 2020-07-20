import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:haversine/haversine.dart';

class AbsentPage extends StatefulWidget {
  @override
  _AbsentPage createState() => _AbsentPage();
}

class _AbsentPage extends State<AbsentPage> {
  double _resultLocation, _locationLat, _locationLong;
  String _infoLocation = "";
  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      double lat1 = -6.2523429;
      double lon1 = 106.8420473;

      double lat2 = position.latitude;
      double lon2 = position.longitude;

      final harvesine = new Haversine.fromDegrees(
          latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);

      _resultLocation = harvesine.distance() / 1000;

      setState(() {
        _infoLocation = "${_resultLocation}";
      });
      if (_resultLocation > 1) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Jarak Anda Terlalu Jauh")));
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Jarak Valid")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
          body: Stack(
        children: <Widget>[
          Align(
            child: Image.asset('assets/images/building.jpg'),
            alignment: Alignment.topCenter,
          ),
          Positioned(
            top: 150,
            right: 15,
            left: 15,
            height: 200,
            child: Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Text(""),
                    Text(""),
                    Text(
                      "Time : Regular (09:00:00 - 16:00:00) WIB",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.black,
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.fingerprint),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Absent In"),
                                      )
                                    ],
                                  ),
                                  color: Colors.grey,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  onPressed: () {
                                    _getCurrentLocation();
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.fingerprint),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Absent Out"),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  color: Colors.grey,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            top: 120,
            right: 100,
            left: 100,
            height: 60,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.red,
              elevation: 7,
              child: ListTile(
                  title: Text('Absent',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white))),
            ),
          ),
          Text(_infoLocation)
        ],
      )),
    );
  }
}
