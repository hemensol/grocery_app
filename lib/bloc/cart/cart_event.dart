import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {}

class GetDataButtonPressed extends CartEvent {

  @override
  List<Object> get props => [];
}

class RemoveItemFromCart extends CartEvent {
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}