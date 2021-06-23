import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/providers/cart.dart';

import 'package:flutter_task/widgets/product_item.dart';
import 'package:provider/provider.dart';


class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            'Products',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 6,
          ),
          Text(
            'Select product and adjust quantity',
            style: TextStyle(color: Color(0xff4D4D4D), fontSize: 12),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('items').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final userData=snapshot.data.docs;
                return ListView.builder(

                  itemCount: userData.length,
                  itemBuilder: (ctx,i){
                    return ProductItem(
                      price: userData[i]['price'],
                      title: userData[i]['title'],
                      description: userData[i]['description'],
                      imageUrl: userData[i]['imageUrl'],
                      id: userData[i]['id'],
                      vatAmount: userData[i]['vatamount'],



                    );
                  },
                );
              },
            ),
//
          ),
        ],
      ),
    );
  }
}
