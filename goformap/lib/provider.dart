import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goformap/showmap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class provider extends ChangeNotifier {
  late double letitude;
  late double longitude;
  late LatLng currentlocation;

  void getdata() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('location').get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      letitude = data['letitude'];
      longitude = data['longitude'];
      // print("ooooooooooooooooooo ");
    }
  }

  void setcurrentlocation() {
    currentlocation = LatLng(letitude, longitude);
    print("xxxxxxxxxxxxxxxxxxxxxx $currentlocation");
    notifyListeners();
  }

  Map<String, Marker> map = {};

  addmarker(String id, LatLng location) async {
    var marker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId(id),
      position: location,
    );
    map[id] = await marker;
    notifyListeners();
    //setState(() {});
  }

  void z() {
    FirebaseFirestore.instance
        .collection('location')
        .doc('user1')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database ${documentSnapshot.data()}');
      }
    });
  }
}
