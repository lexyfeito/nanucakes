import 'package:uuid/uuid.dart';

class CakeModel {
  String _id;
  String description;
  String flavor;

  CakeModel(this.description, this.flavor) {
    var uuid = new Uuid();
    this._id = uuid.v1();
  }

  String get id => this._id;
}