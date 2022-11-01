part of 'user_details_bloc.dart';

abstract class UsersDetailsEvent extends Equatable {
  const UsersDetailsEvent();
}

class UserDetailsApiEvent extends UsersDetailsEvent {
  final String user;

  const UserDetailsApiEvent(this.user);

  @override
  List<Object?> get props => [
        user,
      ];
}
