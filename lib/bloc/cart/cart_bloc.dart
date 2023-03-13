import 'package:bloc/bloc.dart';
import 'package:grocery_app/service/apiService.dart';

import '../cart/cart_event.dart';
import '../cart/cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final _apiServiceProvider = ApiServiceProvider();
  List cartItems = [];
  int index = 0;
  num price = 0;

  CartBloc() : super(CartInitialState()) {
     on<GetCartItems>((event, emit) async {
      emit(CartLoadingState());
      emit(CartSuccessState(Item: cartItems));
    });

    on<AddCartItem>((event, emit) {
      emit(CartLoadingState());
      cartItems.add(event.cartItem);
      emit(CartSuccessState(Item: cartItems));
      price = price + event.cartItem.price;
    });

    on<RemoveCartItem>((event, emit) {
      emit(CartLoadingState());
      cartItems.removeAt(event.index);
      emit(CartSuccessState(Item: cartItems));
      price = price - event.cartItem.price;
    });
  }
}
