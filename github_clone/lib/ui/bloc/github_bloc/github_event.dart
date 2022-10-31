part of 'github_bloc.dart';

abstract class GithubEvent extends Equatable {
  const GithubEvent();
}

/// profile event

class ProfileApiEvent extends GithubEvent {
  final String user;

  const ProfileApiEvent(this.user);

  @override
  List<Object?> get props => [
        user,
      ];
}

/// repository event

class RepositoryApiEvent extends GithubEvent {
  final String user;

  const RepositoryApiEvent(this.user);

  @override
  List<Object?> get props => [
        user,
      ];
}
