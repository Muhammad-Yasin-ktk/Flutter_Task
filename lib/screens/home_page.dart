import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/screens/product_overview_screen.dart';

import 'cart_screen.dart';

class HomePage extends StatelessWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  final List<Map<String, Object>> _pages = [
//    {
//      'page': ProductsOverviewScreen(),
//
//    },
//    {
//      'page': CartScreen(),
//
//    },
//  ];
//  int _selectedPageIndex = 0;
//
//  void _selectPage(int index) {
//    setState(() {
//      _selectedPageIndex = index;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          'assets/icon/advalogo.svg', height: 35, width: 40,),
      actions: [
        IconButton(icon: Icon(Icons.shopping_cart,color: Color(0xFFBF6159),), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CartScreen()));
        })
      ],
      ),

      body: ProductsOverviewScreen(),
    );
  }
}

//      _pages[_selectedPageIndex]['page'],
//      bottomNavigationBar: BottomNavigationBar(
//        onTap: _selectPage,
//        backgroundColor: Colors.white,
//
//        selectedItemColor: Color(0xff515151),
//        currentIndex: _selectedPageIndex,
//        // type: BottomNavigationBarType.fixed,
//        items: [
//          BottomNavigationBarItem(
//            backgroundColor: Color(0xff515151),
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            backgroundColor: Color(0xff515151),
//            icon: Icon(Icons.shopping_cart),
//            title: Text('Cart'),
//          ),
//        ],
////      ),
//    );
//  }
//}
