import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_model/github_user_response.dart';
import '../../../data/service/api_service.dart';

part 'github_event.dart';

part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GitHubState> {
  final APIService _apiService;

  GithubBloc(this._apiService) : super(GithubInitialState()) {
    /// profile
    on<ProfileApiEvent>((event, emit) async {
      emit(ProfileLoadingState());

      final response = await _apiService.getUser(event.user);
      if (response.hashCode == 500) {
        emit(const ProfileErrorState());
      } else if (response.hashCode == 200) {
        emit(const NoInternetState());
      } else {
        emit(ProfileLoadedState(response));
      }
    });

    ///repository
    on<RepositoryApiEvent>((event, emit) async {
      emit(RepositoryLoadingState());

      final response = await _apiService.getUser(event.user);
      if (response.hashCode == 500) {
        emit(const RepositoryErrorState());
      } else if (response.hashCode == 200) {
        emit(const NoInternetState());
      } else {
        emit(RepositoryLoadedState(response));
      }
    });
  }
}
