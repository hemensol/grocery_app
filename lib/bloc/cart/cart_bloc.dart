import 'package:bloc/bloc.dart';
import 'package:grocery_app/service/apiService.dart';

import '../cart/cart_event.dart';
import '../cart/cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final _apiServiceProvider = ApiServiceProvider();
  List cartItems = [];

  CartBloc() : super(CartInitialState()) {
     on<GetCartItems>((event, emit) async {
      emit(CartLoadingState());
      emit(CartSuccessState(Item: cartItems));
    });

    on<AddCartItem>((event, emit) {
      emit(CartLoadingState());
      cartItems.add(event.cartItem);
      emit(CartSuccessState(Item: cartItems));
    });

    on<RemoveCartItem>((event, emit) {
      emit(CartLoadingState());
      cartItems.removeWhere((element) => element.id == event.cartItem.id);
      emit(CartSuccessState(Item: cartItems));
    });
  }
}
