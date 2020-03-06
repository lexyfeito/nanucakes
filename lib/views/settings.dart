import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/counter.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return SafeArea(
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center();
        },
      ),
    );
  }
}