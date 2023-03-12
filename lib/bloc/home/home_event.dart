import 'package:equatable/equatable.dart';

import '../../model/item_model.dart';

abstract class HomeEvent extends Equatable {}

class GetDataButtonPressed extends HomeEvent {

  @override
  List<Object> get props => [];
}


