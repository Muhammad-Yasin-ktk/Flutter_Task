import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/providers/cart.dart';
import 'package:flutter_task/screens/home_page.dart';
import 'package:flutter_task/screens/order_information.dart';
import 'package:provider/provider.dart';

import 'providers/order.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
            title: 'Flutter task',

            home: HomePage(),
        routes: {
          OrderInformation.routeName:(ctx)=>OrderInformation(),

        },

      ),
    );
  }
}
