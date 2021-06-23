import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/product_list.dart';
import 'package:provider/provider.dart';


import './cart_screen.dart';



class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

//      drawer: AppDrawer(),
      body: ProductList(),
    );
  }
}
