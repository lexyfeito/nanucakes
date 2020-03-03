import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/models/cake.dart';

class CartItem extends StatefulWidget {

  final CakeModel cake;

  CartItem(this.cake);

  @override
  State<StatefulWidget> createState() => _CartItem(cake);
}

class _CartItem extends State<CartItem> {

  final CakeModel cake;
  CartBloc _cartBloc;
  int _count = 1;

  _CartItem(this.cake);

  @override
  Widget build(BuildContext context) {

    _cartBloc = BlocProvider.of<CartBloc>(context);

    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 150.0,
                width: 150.0,
                child: Image(
                  image: AssetImage('assets/cupcake.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${cake.description}',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'Flavor: ${cake.flavor}',
                            style: TextStyle(
                                fontSize: 14.0
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: Icon(Icons.keyboard_arrow_down),
                            onTap: () => _downCount(),
                          ),
                        ),
                        Text('$_count'),
                        Container(
                            margin: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: Icon(Icons.keyboard_arrow_up),
                              onTap: () => _upCount(),
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: GestureDetector(
                  child: Icon(Icons.delete_outline),
                  onTap: () {
                    _cartBloc.add(RemoveCake(cake));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _upCount() {
    if (_count == 10) return;
    setState(() => _count++);
    cake.qty = _count;
    _cartBloc.calculateTotal();
  }

  _downCount() {
    if (_count == 1) return;
    setState(() => _count--);
    cake.qty = _count;
    _cartBloc.calculateTotal();
  }
}