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

class CartBloc extends Bloc<CartEvent, CartState>{

  CartModel cart = CartModel(List.from([CakeModel("chocolate")]));

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
    }
  }

  Stream<CartState> _mapLoadCartToState() async* {
    try {
      // final cart = await this.todosRepository.loadTodos();
      yield CartLoaded(
        cart,
      );
    } catch (_) {
      yield CartNotLoaded();
    }
  }

  Stream<CartState> _mapAddCakeToState(AddCake event) async* {
    if (state is CartLoaded) {
      cart.cakes.add(event.cake);
      yield CartLoaded(cart);
    }
  }

  Stream<CartState> _mapRemoveCakeToState(RemoveCake event) async* {
    cart.cakes.removeLast();
    yield CartLoaded(cart);
  }
}