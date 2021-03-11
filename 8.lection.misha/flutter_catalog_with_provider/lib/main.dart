import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'pages/splash.dart';
import 'pages/home.dart';
import 'pages/content.dart';
import 'pages/ordered_productions.dart';
import 'providers/Product.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: MaterialApp(
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => Splash(),
          '/': (_) => Homepage(),
          '/content': (_) => Content(),
          '/ordered-production': (_) => OrderedProductions(),
        },
      ),
    ),
  );
}
