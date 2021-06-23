import 'package:flutter/material.dart';
import 'package:flutter_task/providers/cart.dart';
import 'package:flutter_task/screens/order_information.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderToday extends StatelessWidget {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatter.format(now);
    final cart = Provider.of<Cart>(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(OrderInformation.routeName);
          },
          child: Container(
            height: 180,
            margin: EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'ID-232',
                              style: TextStyle(
                                  color: Color(0xffBF6159),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Date: $formattedDate',
                              style: TextStyle(color: Color(0xff818181)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.pending_outlined,
                              color: Color(0xffBF7349),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Pending',
                              style: TextStyle(
                                  color: Color(0xff4D4C4C),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Customer',
                      style: TextStyle(color: Color(0xff818181)),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pament Method',
                          style: TextStyle(color: Color(0xff818181)),
                        ),
                        Text(
                          'Total          ',
                          style: TextStyle(color: Color(0xff818181)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'SAR ${cart.totalGrantAmount}',
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
