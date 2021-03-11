import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/WeatherCity.dart';
import '../utils/available_cities.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter weather with API',
      theme: ThemeData(
        fontFamily: 'RedHatDisplayRegular',
        primaryColor: Color(0xFF40C4FF),
        appBarTheme: AppBarTheme(
          color: Color(0xFF40C4FF),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter weather with API',
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
          actions: <Widget>[
            IconButton(
              color: Color(0xFFFFFFFF),
              icon: Icon(Icons.location_searching),
              onPressed: () {
                context.read<WeatherCityModel>().changeCityName('myOwnPosition');
                Navigator.of(context).pushNamed('/more-detail-weather');
              },
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF40C4FF),
                Color(0xFF9AE0FF),
              ],
            ),
          ),
          child: Container(
            alignment: Alignment.topCenter,
            child: ListView(
              padding: EdgeInsets.all(5),
              shrinkWrap: true,
              children: <Widget>[
                for (int i = 0; i < CITIES.length; i++)
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 246,
                              height: 66,
                              child: Text(
                                CITIES[i],
                                style: new TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Transform.rotate(
                          angle: -90 * 3.14 / 180,
                          child: IconButton(
                            iconSize: 32.0,
                            icon: Icon(
                              Icons.arrow_circle_down,
                            ),
                            onPressed: () {
                              context.read<WeatherCityModel>().changeCityName(CITIES[i]);
                              Navigator.of(context).pushNamed('/more-detail-weather');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }
}