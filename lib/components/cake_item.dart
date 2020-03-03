import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanu_cakes/models/cake.dart';

class CakeItem extends StatelessWidget {

  final CakeModel cake;

  CakeItem(this.cake);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(cake.image),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Text(
                  cake.description,
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  cake.price.toString()
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}