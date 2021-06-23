import 'package:flutter/material.dart';


import 'history_screen.dart';
import 'order_today.dart';

class TabbarScreen extends StatefulWidget {
  static const routeName='tabscreen';
  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF3F3F3),
          automaticallyImplyLeading: false,
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new TabBar(
                labelColor: Colors.black,
                labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                unselectedLabelColor: Colors.grey,
                indicatorColor:Color(0xffF5F5F5),
                indicatorWeight: 0.2,

                tabs: [
                  Tab(
                    text: 'Today',
                  ),
                  Tab(
                    text: 'History',
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrderToday(),
            HistoryScreen(),
          ],
        ),
      ),
    );
  }
}
