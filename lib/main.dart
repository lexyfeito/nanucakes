import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/blocs/cart.dart';
import 'package:nanu_cakes/blocs/counter.dart';
import 'package:nanu_cakes/views/cart.dart';
import 'package:nanu_cakes/views/home.dart';
import 'package:nanu_cakes/views/login.dart';
import 'package:nanu_cakes/views/settings.dart';

void main() => runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
            create: (_) => CounterBloc()
        ),
        BlocProvider<CartBloc>(
            create: (_) => CartBloc()
        )
      ],
      child: MyApp(),
    )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Main();
}

class _Main extends State<Main> {
  int _selectedIndex = 0;

  List views = [
    Home(),
    Cart(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheat Day"),
      ),
      // body: views.elementAt(_selectedIndex),
      body: Login(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings')
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
