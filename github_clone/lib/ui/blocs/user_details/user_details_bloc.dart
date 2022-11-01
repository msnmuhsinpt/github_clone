import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/api_model/repository_response.dart';
import '../../../data/service/api_service.dart';

part 'user_details_event.dart';

part 'user_details_state.dart';

class UsersDetailsBloc extends Bloc<UsersDetailsEvent, UsersDetailsState> {
  final APIService _apiService;

  UsersDetailsBloc(this._apiService) : super(UserDetailsInitialState()) {
    on<UserDetailsApiEvent>((event, emit) async {
      emit(UserDetailsLoadingState());
      final response = await _apiService.getRepo(event.user);
      if (response.hashCode == 500) {
        emit(const ErrorState());
      } else if (response.hashCode == 200) {
        emit(const NoInternetState());
      } else {
        emit(
          UserDetailsLoadedState(response),
        );
      }
    });
  }
}
