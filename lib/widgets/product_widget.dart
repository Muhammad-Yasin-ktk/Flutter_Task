import 'package:flutter/material.dart';
import 'package:flutter_task/providers/cart.dart';
import 'package:provider/provider.dart';
class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
//                    margin: EdgeInsets.only(right: 3),
      height: 230,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5, vertical: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/icon/Products_icon.png',
                fit: BoxFit.contain,
                height: 50,width: 50,

              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Products',
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Total',
                style: TextStyle(
                    color: Color(0xff7D7D7D), fontSize: 17),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '${cart.itemCount}',
                style: TextStyle(
                    color: Color(0xff515050),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
