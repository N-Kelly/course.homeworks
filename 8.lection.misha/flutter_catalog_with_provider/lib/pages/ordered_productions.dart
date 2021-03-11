import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Product.dart';
import '../utils/products.dart';

class OrderedProductions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFFFFFFFF),
          appBarTheme: AppBarTheme(color: Color(0xFFFFFFFF))),
      title: 'Cart',
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Cart'),
            centerTitle: true,
          ),
          body: Container(
            color: Color(0xFFFFED58),
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            child: (context.watch<ProductModel>().allItems.length > 0)
                ? ListView(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    children: <Widget>[
                      Text(
                        'Total cost: ${context.watch<ProductModel>().totalPrice.toStringAsFixed(2)}\$',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < PRODUCTS.length; i++)
                        if (context
                            .watch<ProductModel>()
                            .allItems
                            .contains(PRODUCTS[i]['id']))
                          SizedBox(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFF333333),
                                        ),
                                      ),
                                      child: Container(
                                        width: 66,
                                        height: 66,
                                        color: PRODUCTS[i]['color'],
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: 180,
                                      height: 66,
                                      child: Text(
                                        PRODUCTS[i]['name'],
                                        style: new TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('${PRODUCTS[i]['price']}\$'),
                              ],
                            ),
                          ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Text(
                          'Нou haven\'t added any products yet :(',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
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
