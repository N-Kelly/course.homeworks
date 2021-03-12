import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Product.dart';
import '../components/add_production_to_card_button.dart';
import '../utils/products.dart';
import '../storage.dart';
import '../default_theme.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getDefaultTheme(),
      title: 'Catalog',
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              onPressed: () =>
                  Navigator.pushNamed(context, '/ordered-production'),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Storage().toggleUserAuth();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
              ),
            ],
            title: Text('Catalog'),
            centerTitle: true,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            child: ListView(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              children: <Widget>[
                for (int i = 0; i < PRODUCTS.length; i++)
                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          color: PRODUCTS[i]['color'],
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            height: 66,
                            child: Text(
                              PRODUCTS[i]['name'],
                              style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        AddProductionToCardButton(
                          onOrder: () => context
                              .read<ProductModel>()
                              .add(PRODUCTS[i]['id']),
                          onCancelOrder: () => context
                              .read<ProductModel>()
                              .remove(PRODUCTS[i]['id']),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
