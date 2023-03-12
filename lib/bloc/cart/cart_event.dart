import 'package:equatable/equatable.dart';

import '../../model/item_model.dart';

abstract class CartEvent extends Equatable {}

class GetDataButtonPressed extends CartEvent {

  @override
  List<Object> get props => [];
}

class ManipulateItem extends CartEvent {
  Item cartItem;

  ManipulateItem({
    required this.cartItem
    });

  @override
  List<Object> get props => [];
}
