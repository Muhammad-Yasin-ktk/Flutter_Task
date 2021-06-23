import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/providers/cart.dart';
import 'package:flutter_task/screens/product_screen.dart';
import 'package:provider/provider.dart';




class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Invoice Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Color(0xffBF6159),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 110,
                width: double.infinity,
                color: Color(0xffFFF9F9),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Price'),
                            Text('SAR ${cart.totalAmount}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('VAT Amount'),
                            Text('SAR ${cart.totalVatAmount}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grand Total',
                      style:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'SAR ${cart.totalGrantAmount}',
                      style:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
//
                  openAlertBox(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xffBF6159),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color myColor = Color(0xff00bfa5);

  openAlertBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ProductScreen()));
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(70.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              height: 100,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green,
                    size: 30,
                  ),
//
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Your Order has been placed',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Please collect your item from counter',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
//      body: Column(
//        children: <Widget>[
//          Card(
//            margin: EdgeInsets.all(15),
//            child: Padding(
//              padding: EdgeInsets.all(8),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    'Total',
//                    style: TextStyle(fontSize: 20),
//                  ),
//                  Spacer(),
//                  Chip(
//                    label: Text(
//                      '\$${cart.totalAmount.toStringAsFixed(2)}',
//                      style: TextStyle(
//                        color: Theme.of(context).primaryTextTheme.title.color,
//                      ),
//                    ),
//                    backgroundColor: Theme.of(context).primaryColor,
//                  ),
//                  FlatButton(
//                    child: Text('ORDER NOW'),
//                    onPressed: () {
//                      Provider.of<Orders>(context, listen: false).addOrder(
//                        cart.items.values.toList(),
//                        cart.totalAmount,
//                      );
//                      cart.clear();
//                    },
//                    textColor: Theme.of(context).primaryColor,
//                  )
//                ],
//              ),
//            ),
//          ),
//          SizedBox(height: 10),
//          Expanded(
//            child: ListView.builder(
//              itemCount: cart.items.length,
//              itemBuilder: (ctx, i) => CartItem(
//                    cart.items.values.toList()[i].id,
//                    cart.items.keys.toList()[i],
//                    cart.items.values.toList()[i].price,
//                    cart.items.values.toList()[i].quantity,
//                    cart.items.values.toList()[i].title,
//                  ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
