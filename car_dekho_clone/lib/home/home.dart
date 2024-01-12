import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Reference firebasestorage = FirebaseStorage.instance.ref();

  List<String> img_names = [
    "first_image.png",
    "second_image.png",
    "third_image.png",
    "four_image.png",
    "five_image.png"
  ];
  List list_of_image_download_url = [];

  Future<String> get_download_url(String imgname) async {
    print("  get_download_url cal");
    var download_url = await firebasestorage
        .child("home_5_images")
        .child("$imgname")
        .getDownloadURL();
    return download_url;
  }

  void fill_list_of_image_download_url() async {
    for (var i = 0; i < img_names.length; i++) {
      var temp = await get_download_url("${img_names[i]}");
      list_of_image_download_url.add(temp);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(img_names.length);
    fill_list_of_image_download_url();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("${list_of_image_download_url.length}"),
          Expanded(
            child: ListView.builder(
              itemCount: list_of_image_download_url.length,
              itemBuilder: (context, index) {
                return Image.network(list_of_image_download_url[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
