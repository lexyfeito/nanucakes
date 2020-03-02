import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';

class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _cartBloc = BlocProvider.of<CartBloc>(context);

    _cartBloc.add(LoadCart());

    return SafeArea(
      child: BlocBuilder<CartBloc, CartState>(
          builder: (context, CartState state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoaded) {
              final cakes = state.cart.cakes;
              return ListView(
                children: cakes.map((cake) {
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
                            Column(
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
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        child: IconButton(
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Text('2'),
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        child: IconButton(
                                          icon: Icon(Icons.keyboard_arrow_up),
                                          onPressed: () {},
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: FlatButton(
                                child: Icon(Icons.delete_outline),
                                onPressed: () {
                                  _cartBloc.add(RemoveCake(cake));
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ) ;
            } else {
              return Center(
                child: Text("Empty Cart ..."),
              );
            }
          }
      ),
    );
  }
}