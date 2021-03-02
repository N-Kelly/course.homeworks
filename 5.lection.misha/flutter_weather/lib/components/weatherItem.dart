import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherItem extends StatefulWidget {
  final String _city;
  final String _iconType;
  final String _degree;
  final String _date;

  WeatherItem(this._city, this._iconType, this._degree, this._date);

  void printPretty() {
    print('========= Weather item =========');
    print('city => $_city');
    print('iconType => $_iconType');
    print('degree => $_degree');
    print('date => $_date');
    print('================================');
  }

  @override
  WeatherItemState createState() => WeatherItemState(_city, _iconType, _degree, _date);
}

class WeatherItemState extends State<WeatherItem> {
  final String city;
  final String iconType;
  final String degree;
  final String date;

  WeatherItemState(this.city, this.iconType, this.degree, this.date);



  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 60, bottom: 25),
              child:  Image.asset('assets/images/weather_types/$iconType.png', scale: 0.8)
          ),
          Text(
              '$city',
              style: TextStyle(fontFamily: 'RedHatDisplayRegular', fontSize: 42)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
                '$degree ℃',
                style: TextStyle(fontFamily: 'RedHatDisplayMedium', fontSize: 42)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:  Text(
                'Last Updated at $date',
                style: TextStyle(fontFamily: 'RedHatDisplayRegular', fontSize: 16)
            ),
          )
        ]
    );
  }
}