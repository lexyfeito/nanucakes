import 'package:equatable/equatable.dart';
import 'package:nanu_cakes/models/cake.dart';

class CartTotal extends Equatable {

  double subTotal;
  double taxes;
  double total;

  CartTotal(
      this.subTotal,
      this.taxes,
      this.total
      );

  @override
  List<Object> get props => [subTotal, taxes, total];
}

class CartModel extends Equatable {
  List<CakeModel> cakes;

  CartModel(this.cakes);

  @override
  List<Object> get props => [cakes];

  calculateTotal() {
    double subTotal = 0;
    if (cakes.isNotEmpty) {
      cakes.forEach((cake) {
        subTotal += (cake.price * cake.qty).roundToDouble();
      });
    }
    double taxes = (subTotal * 0.07).roundToDouble();
    double total = (subTotal + taxes).roundToDouble();

    return CartTotal(subTotal, taxes, total);
  }
}