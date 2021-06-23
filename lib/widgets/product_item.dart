import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task/providers/cart.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String description;
  final String title;
  final String imageUrl;
  final int price;
  final int vatAmount;



  ProductItem(
      {this.price,
      this.description,
      this.title,
      this.imageUrl,
      this.id,
      this.vatAmount,

      });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(widget.imageUrl),
                    height: 100,
                    width: 110,
                    fit: BoxFit.fill,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 35, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                          widget.description,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 35, right: 5),
                      child: Text(
                        'SAR ${widget.price}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFBF6159),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.remove),
                            iconSize: 15.0,
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                if(counter==0){return;}
                                counter--;
                              });
                              cart.removeSingleItem(widget.id);
                            },
                          ),
                        ),
                        Text(counter.toString()),

                        Container(
                          height: 40,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFBF6159),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.add),
                            iconSize: 15.0,
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                              cart.addItem(widget.id, widget.price.toDouble(),
                                  widget.title, widget.vatAmount.toDouble(),widget.imageUrl);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
