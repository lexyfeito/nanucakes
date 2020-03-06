import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/components/cart_item.dart';
import 'package:nanu_cakes/views/checkout.dart';

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

              if (cakes.isEmpty) {
                return Center(
                  child: Text("Empty Cart ..."),
                );
              }

              final total = state.cart.calculateTotal();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                "Subtotal: \$${total.subTotal}"
                            ),
                            Text(
                                "Taxes: \$${total.taxes}"
                            ),
                            Text("Total: \$${total.total}"),
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: cakes.map((cake) {
                        return CartItem(cake);
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("CHECKOUT "),
                          Icon(Icons.payment)
                        ],
                      ),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout())),
                    ),
                  )
                ],
              );
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