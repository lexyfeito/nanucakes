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
          return Column(
            children: <Widget>[
              Text(count.toString()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _counterBloc.add(CounterEvent.increment);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    _counterBloc.add(CounterEvent.decrement);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}