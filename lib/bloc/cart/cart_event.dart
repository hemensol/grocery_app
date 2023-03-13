import 'package:equatable/equatable.dart';

import '../../model/item_model.dart';

abstract class CartEvent extends Equatable {}

class GetCartItems extends CartEvent {
  GetCartItems();

  @override
  List<Object> get props => [];
}

class AddCartItem extends CartEvent {
  Item cartItem;

  AddCartItem({
    required this.cartItem
    });

  @override
  List<Object> get props => [];
}
class RemoveCartItem extends CartEvent {
  Item cartItem;

  RemoveCartItem({
    required this.cartItem
    });

  @override
  List<Object> get props => [];
}
