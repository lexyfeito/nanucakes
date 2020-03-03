import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/models/cake.dart';

class CakeDetails extends StatefulWidget {

  final CakeModel cake;

  CakeDetails(this.cake);

  @override
  State<StatefulWidget> createState() => _CakeDetails(cake);
}

class _CakeDetails extends State<CakeDetails> {

  final CakeModel cake;

  _CakeDetails(this.cake);

  String selectedFlavor;

  @override
  void initState() {
    super.initState();
    if (cake.flavors.isNotEmpty) {
      selectedFlavor = cake.flavors[0].description;
    }
  }


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
                  image: AssetImage(cake.image),
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                    cake.description,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                      'Price: ${cake.price}'
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                          "Select Flavor: "
                      ),
                      DropdownButton(
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (selected) {
                          selectedFlavor = selected;
                          setState(() => selectedFlavor);
                        },
                        value: selectedFlavor,
                        items: cake.flavors.map((flavor) {
                          return DropdownMenuItem(
                            value: flavor.description,
                            child: Text(flavor.description),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Add to cart'),
                      onPressed: () {
                        var cakeModel = CakeModel(
                            description: cake.description,
                            flavor: selectedFlavor,
                            price: cake.price
                        );
                        cakeModel.id = cake.id;
                        _cartBloc.add(
                            AddCake(cakeModel)
                        );
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