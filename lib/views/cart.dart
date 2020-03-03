import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/components/cart_item.dart';

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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                "Subtotal: \$${_cartBloc.subTotal}"
                            ),
                            Text(
                                "Taxes: \$${_cartBloc.taxes}"
                            ),
                            Text("Total: \$${_cartBloc.total}"),
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