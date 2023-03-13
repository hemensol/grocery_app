import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class CartInitialState extends CartState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class CartSuccessState extends CartState {
  final List Item;

  CartSuccessState({
    required this.Item, 
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class CartFailState extends CartState {
  String message;

  CartFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
