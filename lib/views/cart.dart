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
                return ListTile(
                  title: Text(cake.flavor),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      _cartBloc.add(RemoveCake(cake));
                    },
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

// ListView(
//        children: cart.map((item) {
//          return ListTile(
//            leading: Image(
//              image: AssetImage('assets/cupcake.jpg'),
//            ),
//            title: Text(item.title),
//            subtitle: Text(item.price.toString()),
//            trailing: IconButton(
//              icon: Icon(Icons.delete_outline),
//              onPressed: () {
//                showDialog(
//                    context: context,
//                    builder: (context) {
//                      return AlertDialog(
//                        title: Text("Remove"),
//                        content: Text("Are you sure...?"),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text(
//                                "Remove"
//                            ),
//                            onPressed: () {
//                              int index = cart.indexWhere((item) => item.id == item.id);
//                              setState(() {
//                                cart.removeAt(index);
//                              });
//                              Navigator.pop(context);
//                            },
//                          )
//                        ],
//                      );
//                    }
//                );
//              },
//            ),
//          );
//        }).toList(),
//      )