import 'package:bloc/bloc.dart';
import 'package:grocery_app/service/apiService.dart';

import '../cart/cart_event.dart';
import '../cart/cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final _apiServiceProvider = ApiServiceProvider();

  CartBloc() : super(CartInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(CartLoadingState());
      final items = await _apiServiceProvider.fetchItem();
      emit(CartSuccessState(Item: items!));
    });
  }
}
