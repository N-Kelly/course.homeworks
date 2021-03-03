import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherItem extends StatelessWidget {
  final String city;
  final String iconType;
  final String degree;
  final String date;

  WeatherItem(this.city, this.iconType, this.degree, this.date);

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
  void printPretty() {
    print('========= Weather item =========');
    print('city => $city');
    print('iconType => $iconType');
    print('degree => $degree');
    print('date => $date');
    print('================================');
  }

}