import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goformap/provider.dart';
import 'package:goformap/showmap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class showmap extends StatelessWidget {
  late GoogleMapController mapController;
  bool added = false;

  Future<void> updatecamerapos(snapshot) async {
    await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 14.4,
            target: LatLng(snapshot.data!.docs[0]['letitude'],
                snapshot.data!.docs[0]['longitude']))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('location').snapshots(),
          builder: (context, snapshot) {
            if (added) {
             // updatecamerapos(snapshot);
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // return ListView.builder(
              //    itemCount: snapshot.data!.docs.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(

              //       title:
              //           Text(snapshot.data!.docs[index]['letitude'].toString()),
              //     );
              //   },
              // );

              return GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                  added = true;
                },
                initialCameraPosition: CameraPosition(
                    zoom: 14.4,
                    target: LatLng(snapshot.data!.docs[0]['letitude'],
                        snapshot.data!.docs[0]['longitude'])),
                markers: {
                  Marker(
                      markerId: MarkerId("a"),
                      position: LatLng(snapshot.data!.docs[0]['letitude'],
                          snapshot.data!.docs[0]['longitude']))
                },
              );
            }
          }),
    );
  }
}
