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
  String id;
  String description;
  List<CakeFlavorModel> flavors;
  String flavor;
  List<String> ingredients;
  String image;
  double price;
  int qty;

  CakeModel(
      {
        this.id,
        this.description,
        this.flavors,
        this.flavor,
        this.ingredients,
        this.image,
        this.price,
        this.qty
      });

  factory CakeModel.fromJson(Map<String, dynamic> parsedJson) {
    final List<dynamic> flavors = parsedJson["flavors"];
    return CakeModel(
      id: parsedJson['id'],
      description: parsedJson["description"],
      flavors: flavors.map((item) => CakeFlavorModel(description: item)).toList(),
      flavor: parsedJson["flavor"],
      image: parsedJson["image"],
      price: parsedJson["price"]
    );
  }
}