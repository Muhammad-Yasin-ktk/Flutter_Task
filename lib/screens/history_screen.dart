import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: orderData.orders.length,
      itemBuilder: (ctx, i) {
        return Container(
          height: 180,
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
                            'ID-323',
                            style: TextStyle(
                                color: Color(0xffBF6159),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Date: ${DateFormat('yyyy-MM-dd').format(orderData.orders[i].dateTime)}',
                            style: TextStyle(color: Color(0xff818181)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline,color: Colors.green,),
                          SizedBox(width: 4,),
                          Text('Completed',
                            style: TextStyle(
                                color: Color(0xff4D4C4C),
                                fontWeight: FontWeight.w600
                            ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Customer',style: TextStyle(
                      color: Color(0xff818181)
                  ),),
                  Text('John Doe',style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pament Method',style: TextStyle(
                          color: Color(0xff818181)
                      ),),
                      Text('Total          ',style: TextStyle(
                          color: Color(0xff818181)
                      ),),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('John Doe',style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),),
                      Text('SAR-${orderData.orders[i].amount}',style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
