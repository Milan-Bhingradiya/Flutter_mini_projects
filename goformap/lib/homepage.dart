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

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //location.changeSettings(interval: 300, accuracy: LocationAccuracy.high);
  }

  Location location = Location();
  late LocationData currentlocation;
  StreamSubscription<LocationData>? locationsubscription;

  void addlocation() async {
    Permission.location.request();
    location.changeSettings(
        interval: 300, accuracy: LocationAccuracy.navigation);
    try {
      currentlocation = await location.getLocation();
      FirebaseFirestore.instance.collection('location').doc('user1').set({
        'letitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': "milan2"
      });
    } catch (e) {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $e");
    }
    print("add location");
  }

  Future<void> listenlocation() async {
    locationsubscription = location.onLocationChanged.handleError((onError) {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmm $onError");
      locationsubscription?.cancel();
      setState(() {
        locationsubscription = null;
        print("erorrrrrrrrrrrrrrr");
      });
    }).listen((LocationData currrentlocation2) async {
      final a = currrentlocation2.latitude;
      final b = currrentlocation2.longitude;
      try {
        await FirebaseFirestore.instance
            .collection('location')
            .doc('user1')
            .set({'letitude': a, 'longitude': b, 'name': 'milan'});
      } catch (e) {
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $e");
      }
    });
    print("strat live location");
  }

  void stoplistening() {
    locationsubscription?.cancel();
    setState(() {
      locationsubscription = null;
    });
    print("stop live location");
  }

  void gotomap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => showmap()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ohh yeahh")),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 50,
            width: 100,
          ),
          ElevatedButton(onPressed: addlocation, child: Text("add Location")),
          ElevatedButton(
              onPressed: listenlocation, child: Text("start live location")),
          ElevatedButton(
              onPressed: stoplistening, child: Text("end live location")),
          ElevatedButton(
              onPressed: Provider.of<provider>(context, listen: false).getdata,
              child: Text("getdata")),
          ElevatedButton(
              onPressed: Provider.of<provider>(context, listen: false)
                  .setcurrentlocation,
              child: Text("setcurrentlocation")),
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('location').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title:
                          Text(snapshot.data!.docs[index]['name'].toString()),
                      subtitle: Row(
                        children: [
                          Text(snapshot.data!.docs[index]['letitude']
                              .toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Text(snapshot.data!.docs[index]['longitude']
                              .toString()),
                          ElevatedButton(onPressed: gotomap, child: Text("map"))
                        ],
                      ),
                    );
                  }),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
