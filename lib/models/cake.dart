import 'package:uuid/uuid.dart';

class CakeFlavorModel {
  String description;

  CakeFlavorModel({this.description});

  factory CakeFlavorModel.fromJson(Map<String, dynamic> parseJson) {
    return CakeFlavorModel(
        description: parseJson.toString()
    );
  }
}

class CakeModel {
  String _id;
  String description;
  List<CakeFlavorModel> flavors;
  String flavor;
  List<String> ingredients;
  String image;
  double price;
  int qty;

  CakeModel(
      {
        this.description,
        this.flavors,
        this.flavor,
        this.ingredients,
        this.image,
        this.price,
        this.qty
      }) {
    if (this._id == null) {
      var uuid = new Uuid();
      this._id = uuid.v1();
    }
  }

  set id(value) {
    this._id = value;
  }

  String get id => this._id;

  factory CakeModel.fromJson(Map<String, dynamic> parsedJson) {
    final List<dynamic> flavors = parsedJson["flavors"];
    return CakeModel(
      description: parsedJson["description"],
      flavors: flavors.map((item) => CakeFlavorModel(description: item)).toList(),
      flavor: parsedJson["flavor"],
      image: parsedJson["image"],
      price: parsedJson["price"]
    );
  }
}