part of 'github_bloc.dart';

abstract class GitHubState extends Equatable {
  const GitHubState();
}


class GithubInitialState extends GitHubState {
  @override
  List<Object?> get props => [];
}

///profile

class ProfileLoadingState extends GitHubState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends GitHubState {
  final GithubUserResponse response;

  const ProfileLoadedState(this.response);

  @override
  List<Object?> get props => [response];
}

class ProfileErrorState extends GitHubState {
  const ProfileErrorState();

  @override
  List<Object?> get props => [];
}


///Repository

class RepositoryLoadingState extends GitHubState {
  @override
  List<Object> get props => [];
}

class RepositoryLoadedState extends GitHubState {
  final GithubUserResponse response;

  const RepositoryLoadedState(this.response);

  @override
  List<Object?> get props => [response];
}

class RepositoryErrorState extends GitHubState {
  const RepositoryErrorState();

  @override
  List<Object?> get props => [];
}
///common states

class UnAuthorizedState extends GitHubState {
  const UnAuthorizedState();

  @override
  List<Object?> get props => [];
}

class NoInternetState extends GitHubState {
  const NoInternetState();

  @override
  List<Object?> get props => [];
}
