part of 'user_details_bloc.dart';

abstract class UsersDetailsState extends Equatable {
  const UsersDetailsState();
}

class UserDetailsInitialState extends UsersDetailsState {
  @override
  List<Object?> get props => [];
}

class UserDetailsLoadingState extends UsersDetailsState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoadedState extends UsersDetailsState {
  final RepositoryResponse response;

  const UserDetailsLoadedState(this.response);

  @override
  List<Object?> get props => [response];
}

class ErrorState extends UsersDetailsState {
  const ErrorState();

  @override
  List<Object?> get props => [];
}

class UnAuthorizedState extends UsersDetailsState {
  const UnAuthorizedState();

  @override
  List<Object?> get props => [];
}

class NoInternetState extends UsersDetailsState {
  const NoInternetState();

  @override
  List<Object?> get props => [];
}
