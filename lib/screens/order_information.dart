import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/providers/cart.dart';
import 'package:flutter_task/screens/tabbar_screen.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';

class OrderInformation extends StatelessWidget {
  static const routeName = '/orderinformation';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
//
                      Text(
                        'Back',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Order Information',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Customer Details',
                  style: TextStyle(fontSize: 14, color: Color(0xff727272)),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildCard(context),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Product Details',
                  style: TextStyle(
                    color: Color(0xff818181),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                return _buildProductDetailCart(
//
                  id: cart.items.values.toList()[i].id,
                  title: cart.items.values.toList()[i].title,
                  price: cart.items.values.toList()[i].price,
                  quantity: cart.items.values.toList()[i].quantity,
                  image: cart.items.values.toList()[i].imageurl,

                );
              },
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Total',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        cart.totalGrantAmount.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => TabbarScreen()));
                          },
                          child: Text('Cancel'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: RaisedButton(
                        color: Color(0xffBF6159),
                        onPressed: () {

                          Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(),
                            cart.totalGrantAmount,
                          );
//                          cart.clear();
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildProductDetailCart(
      {String id, int quantity, double price, String title,String image}) {
    return Container(
      height: 170,
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Row(
        children: [
          Image.network(
            //'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          image,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 5,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Explore our range of mens shirts made with finest fabric.',
                        style:
                            TextStyle(color: Color(0xff818181), fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style:
                            TextStyle(color: Color(0xff818181), fontSize: 13),
                      ),
                      Text(
                        'SAR ${quantity*price}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 22,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Remove',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon/addicon.png',
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                          color: Color(
                            0xff333333,
                          ),
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      'assets/icon/minusicon.png',
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildCard(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.perm_identity,
                          color: Color(0xffBF6159),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style:
                              TextStyle(color: Color(0xff818181), fontSize: 12),
                        ),
                        Text(
                          'abc@gmail.com',
                          style: TextStyle(color: Color(0xff333333)),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone no',
                          style:
                              TextStyle(color: Color(0xff818181), fontSize: 12),
                        ),
                        Text(
                          '3328487739',
                          style: TextStyle(color: Color(0xff333333)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Date: 12/05/2021',
                          style: TextStyle(
                            color: Color(0xff818181),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment method',
                          style:
                              TextStyle(color: Color(0xff818181), fontSize: 12),
                        ),
                        Text(
                          'Card Payment',
                          style: TextStyle(color: Color(0xff333333)),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.grey,
                          size: 35,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
