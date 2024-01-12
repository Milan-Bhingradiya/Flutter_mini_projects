import 'package:climaapp/cityscreen.dart';
import 'package:climaapp/logicofcity.dart';
import 'package:climaapp/weather.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'logicofcity.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.sendedlocation});
  final sendedlocation;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Weathermodel weathermodel = Weathermodel();
  String thaticon = "";
  String lastfinalmsg = "";
  double temp = 0;
  int temprature = 0;
  int condition = 0;
  String cityname = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("heloo");
    //  print(widget.sendedlocation["main"]["temp"] );
    updateui(widget.sendedlocation);
  }

  updateui(dynamic weatherdata) {
    setState(() {
      temp = weatherdata['main']['temp'];
      temprature = temp.toInt();
      lastfinalmsg = weathermodel.getMessage(temprature);

      condition = weatherdata['weather'][0]['id'];
      thaticon = weathermodel.getWeatherIcon(condition);

      cityname = weatherdata['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assetsimg/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      locationanddata obj3 = locationanddata();
                      await obj3.getlocation();
                      var forleftbuttonweatherdata = await obj3.getdata();
                      updateui(forleftbuttonweatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                      String typedcityname= await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return cityscreen();
                          },
                        ),
                      );

                      if(cityname!=null)
                        {
                          getdataofcity obj1 = getdataofcity();
                         var typedcitykatemp= await obj1.dataofcity(typedcityname);
                         updateui(typedcitykatemp);
                        }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature' + '°' ,
                      style: TextStyle(
                        // fontFamily: 'Spartan MB',
                        fontSize: 90.0,
                      ),
                    ),
                    Text(
                      '$thaticon',
                      style: TextStyle(
                        fontSize: 60.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 40),
                 child:Text.rich(
                     TextSpan(
                         style: TextStyle(color: Colors.redAccent), //apply style to all

                         children: [
                           WidgetSpan(
                             child: Text(
                               '$lastfinalmsg',
                               textAlign: TextAlign.right,
                               style: TextStyle(  fontSize: 50.0, fontWeight: FontWeight.w500),

                             ),
                           ),
                           WidgetSpan(
                             child: Text(
                               '             ($cityname)'
                               ,textAlign: TextAlign.right,

                               style: TextStyle(  fontSize: 50.0, fontWeight: FontWeight.w600),

                             ),
                           ),
                           //TextSpan(text: '$lastfinalmsg' , style: TextStyle(  fontSize: 50.0, fontWeight: FontWeight.w500),),
                          // TextSpan(text: 'in your $cityname', style: TextStyle(fontSize: 28))
                         ]
                     )
                 )
                 //Text(
                //   "$lastfinalmsg" + "in your $cityname ",
                //   textAlign: TextAlign.right,
                //   style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500),
                //
                // ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
