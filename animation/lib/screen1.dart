import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: 2 * 3.14).animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            print(animation.value);
            return Column(
              children: [
                Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(animation.value * 4),
                    child: CircleAvatar(
                        radius: 60, // Image radius
                        backgroundImage: AssetImage("assets/milan.png"))),
                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      alignment: Alignment.topLeft,
                      transform: Matrix4.identity()
                        ..rotateZ(animation.value * 2),
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.black,
                        child: Image.asset("assets/milan2.png"),
                      ),
                    ),
                    Transform(
                      alignment: Alignment.topRight,
                      transform: Matrix4.identity()..rotateZ(-animation.value),
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.black,
                        child: Image.asset("assets/milan3.png"),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text("_____________________________"),
                ),
                Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.identity()..rotateX(-animation.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/milan.png"),
                  ),
                ),
                Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.identity()..rotateY(-animation.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/milan.png"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
