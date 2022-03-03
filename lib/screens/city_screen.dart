import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  var cityname;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: ktextfield,
                    onChanged: (value) {
                      cityname = value;
                    },
                  )),
              FlatButton(
                onPressed: () {
                  if (cityname != null) {
                    Navigator.pop(context, cityname);
                  } else
                    Alert(
                      context: context,
                      style: alertStyle,
                      type: AlertType.info,
                      title: "ERROR",
                      desc: "NO City Entered",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                          radius: BorderRadius.circular(10.0),
                        ),
                      ],
                    ).show();
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
