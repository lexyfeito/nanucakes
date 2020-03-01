import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/models/cake.dart';

class CakeDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CakeDetails();
}

class _CakeDetails extends State<CakeDetails> {
  @override
  Widget build(BuildContext context) {

    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/cupcake.jpg'),
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                    "Delicious cupcakes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                      'Price: 2.00'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Add to cart'),
                      onPressed: () {
                        _cartBloc.add(AddCake(CakeModel("fresa")));
                        Navigator.pop(context);
                      },
                      color: Colors.pink,
                      textColor: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}