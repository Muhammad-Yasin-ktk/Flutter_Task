import 'package:flutter/material.dart';
class Requisition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//                    margin: EdgeInsets.only(right: 3),
      height: 230,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 5, right: 5, top: 20, bottom: 5),
          child: Column(
            children: [
              Image.asset(
                'assets/icon/Requisition_icon.png',
                fit: BoxFit.contain,
                height: 50,width: 50,

              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Requisition',
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Last request made',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff818181), fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '5th march 2021',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff4D4C4C), fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Last request made',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff818181), fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '5th march 2021',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff4D4C4C),
                    fontSize: 12, fontWeight: FontWeight.w600),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
