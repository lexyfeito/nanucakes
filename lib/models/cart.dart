import 'package:equatable/equatable.dart';
import 'package:nanu_cakes/models/cake.dart';

class CartModel extends Equatable {
  final List<CakeModel> cakes;

  CartModel(this.cakes);

  @override
  List<Object> get props => [cakes];
}