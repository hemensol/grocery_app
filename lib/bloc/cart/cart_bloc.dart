import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/service/apiService.dart';
import 'package:grocery_app/db/database_service.dart';

import '../cart/cart_event.dart';
import '../cart/cart_state.dart';

import 'package:grocery_app/model/item_model.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final _apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List cartItems = [];
  int index = 0;
  num price = 0;

  CartBloc() : super(CartInitialState()) {
    
    on<GetCartItems>((event, emit) async {
      final items = await _service.readItem();
      print(items);
      for (var item in items) {
        cartItems.add(Item.fromJson(item));
      }

      // emit(CartLoadingState());
      emit(CartSuccessState(Item: cartItems));
    });

    on<AddCartItem>((event, emit) {
      emit(CartLoadingState());
      // cartItems.add(event.cartItem);
      _service.saveItem(event.cartItem);
      
      emit(CartSuccessState(Item: cartItems));
      price = price + event.cartItem.price;
    });

    on<RemoveCartItem>((event, emit) {
      emit(CartLoadingState());
      cartItems.removeAt(event.index);
      _service.deleteItem(event.cartItem);
      emit(CartSuccessState(Item: cartItems));
      price = price - event.cartItem.price;
    });
  }
}
