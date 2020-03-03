import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/models/cake.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/views/cake_details.dart';

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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cake.description,
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "\$",
                            style: TextStyle(
                                color: Colors.black
                            ),
                            children: [
                              TextSpan(
                                  text: "${cake.price}",
                                  style: TextStyle(
                                      color: Colors.black
                                  )
                              )
                            ]
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CakeDetails(cake))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}