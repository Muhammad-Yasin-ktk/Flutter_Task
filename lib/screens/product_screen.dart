import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/screens/tabbar_screen.dart';
import 'package:flutter_task/widgets/order_widget.dart';
import 'package:flutter_task/widgets/product_widget.dart';
import 'package:flutter_task/widgets/report_widget.dart';
import 'package:flutter_task/widgets/requisition_widget.dart';


class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Product'),
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              SvgPicture.asset(
                'assets/icon/advalogo.svg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Welcome to KIOSK Panel',
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Make a selection to continue',
                style: TextStyle(fontSize: 16, color: Color(0xff818181)),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Order(),
                  ),
                  Expanded(
                    child: ProductWidget()
                  ),
                ],
              ),
//            SizedBox(
//              height: 6,
//            ),
              Row(
                children: [
                  Expanded(
                    child: Requisition(),
                  ),
                  Expanded(
                    child: Report(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
