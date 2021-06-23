import 'package:flutter/material.dart';
import 'package:flutter_task/screens/tabbar_screen.dart';
class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TabbarScreen()));
      },
      child: Container(
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
                  'assets/icon/Orders_icon.png',
                  fit: BoxFit.contain,
                  height: 50,width: 50,

                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Orders',
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'View order placed by',
                  style: TextStyle(
                      color: Color(0xffB7B7B7), fontSize: 12),
                ),
                Text(
                  'customer or view history',
                  style: TextStyle(
                      color: Color(0xffB7B7B7), fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
