import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final List Item;

  HomeSuccessState({
    required this.Item, 
  });

  @override
  // TODO: implement props
  List<Object> get props => [];
}



class HomeFailState extends HomeState {
  String message;

  HomeFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
