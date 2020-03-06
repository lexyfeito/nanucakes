import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanu_cakes/components/cake_item.dart';
import 'package:nanu_cakes/models/cake.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {

  List cakes = [];

  @override
  void initState() {
    super.initState();
    _getCakes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: cakes.map((cake) {
          return CakeItem(cake);
        }).toList(),
      )
    );
  }

  _getCakes() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/cakes.json");
    final List<dynamic> jsonResult = json.decode(data);
    final cakesModel = jsonResult.map((result) => CakeModel.fromJson(result)).toList();
    setState(() {
      cakes = cakesModel;
    });
  }
}