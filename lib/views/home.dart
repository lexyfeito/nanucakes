import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanu_cakes/views/cake_details.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 300.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CakeDetails()));
                          },
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            child: Image(
                              image: AssetImage('assets/cupcake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}