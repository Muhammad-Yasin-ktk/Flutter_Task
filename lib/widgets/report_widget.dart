import 'package:flutter/material.dart';
class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                'assets/icon/Reports_icon.png',
                fit: BoxFit.contain,
                height: 50,width: 50,

              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Reports',
                style: TextStyle(

                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Last viewed',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff818181),
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '5th march 2021',

                style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff4D4C4C),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
