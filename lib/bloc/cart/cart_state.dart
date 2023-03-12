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
// class RemoveItemFromCart extends CartState {
//   final List Item;

//   RemoveItemFromCart({
//     required this.Item, 
//   });
//   void removeItemFromCart(int index) {
//     Item.removeAt(index);
//   }
//   @override
//   // TODO: implement props
//   List<Object> get props => [];
// }

class CartSuccessState extends CartState {
  final List Item;

  CartSuccessState({
    required this.Item, 
  });
  void removeItemFromCart(int index) {
    Item.removeAt(index);
  }
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
