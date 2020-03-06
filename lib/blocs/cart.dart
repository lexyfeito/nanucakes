import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanu_cakes/models/cake.dart';
import 'package:nanu_cakes/models/cart.dart';

abstract class CartState extends Equatable {

  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cart;

  const CartLoaded([this.cart]);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'TodosLoaded { todos: $cart }';
}

class CartNotLoaded extends CartState {}

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddCake extends CartEvent {
  final CakeModel cake;

  const AddCake(this.cake);

  @override
  List<Object> get props => [cake];

  @override
  String toString() => 'AddCake { todo: $cake }';
}

class RemoveCake extends CartEvent {
  final CakeModel cake;

  const RemoveCake(this.cake);

  @override
  List<Object> get props => [cake];

  @override
  String toString() => 'RemoveCake { todo: $cake }';
}

class CalculateTotal extends CartEvent {}

class CartBloc extends Bloc<CartEvent, CartState>{

  CartModel cart = CartModel([]);

  @override
  CartState get initialState => CartLoading();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadCart) {
      yield* _mapLoadCartToState();
    } else if (event is AddCake) {
      yield* _mapAddCakeToState(event);
    } else if (event is RemoveCake) {
      yield* _mapRemoveCakeToState(event);
    } else if (event is CalculateTotal) {
      yield* _mapCalculateTotalToState(event);
    }
  }

  Stream<CartState> _mapLoadCartToState() async* {
    try {
      yield CartLoaded(
        cart,
      );
    } catch (_) {
      yield CartNotLoaded();
    }
  }

  Stream<CartState> _mapAddCakeToState(AddCake event) async* {
    final index = cart.cakes.indexWhere((item) => item.id == event.cake.id && item.flavor == event.cake.flavor);
    if (index != -1) {
      cart.cakes[index].qty++;
    } else {
      cart.cakes.add(event.cake);
    }
    yield CartLoaded(cart);
  }

  Stream<CartState> _mapRemoveCakeToState(RemoveCake event) async* {
    final id = event.cake.id;
    final flavor = event.cake.flavor;
    final index = cart.cakes.indexWhere((cake) => cake.id == id && cake.flavor == flavor);
    if (index != -1) {
      cart.cakes.removeAt(index);
      yield CartLoading();
      yield CartLoaded(CartModel(cart.cakes));
    }
  }

  Stream<CartState> _mapCalculateTotalToState(CalculateTotal event) async* {
    cart = CartModel(cart.cakes);
    yield CartLoading();
    yield CartLoaded(cart);
  }
}