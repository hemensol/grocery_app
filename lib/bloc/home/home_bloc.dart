import 'package:bloc/bloc.dart';
import 'package:grocery_app/service/apiService.dart';

import '../home/home_event.dart';
import '../home/home_state.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _apiServiceProvider = ApiServiceProvider();
  List items = [];
  HomeBloc() : super(HomeInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(HomeLoadingState());
      final items = await _apiServiceProvider.fetchItem();
      emit(HomeSuccessState(Item: items!));
    });

    
  }
}
