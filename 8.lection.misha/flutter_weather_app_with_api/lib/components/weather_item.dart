import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../weather_types.dart';

class WeatherItem extends StatelessWidget {
  final String iconType;
  final double degree;
  final int date;

  WeatherItem(this.iconType, this.degree, this.date);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 60, bottom: 25),
              child:  Image.asset('assets/images/weather_types/${(AVAILABLE_WEATHER_TYPES.contains(iconType.toLowerCase()) ? iconType.toLowerCase() : WeatherTypes.UNKNOWN )}.png', scale: 0.8)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
                '${(degree - 273.15).toStringAsFixed(2)} ℃',
                style: TextStyle(fontFamily: 'RedHatDisplayMedium', fontSize: 42)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:  Text(
                'Last Updated at ${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(date * 1000))}',
                style: TextStyle(fontFamily: 'RedHatDisplayRegular', fontSize: 16)
            ),
          )
        ]
    );
  }

  void printPretty() {
    print('========= Weather item =========');
    print('iconType => $iconType');
    print('degree => $degree');
    print('date => $date');
    print('================================');
  }

}