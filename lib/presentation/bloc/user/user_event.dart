part of 'user_bloc.dart';
abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object> get props => [];
}

// Event for Getting User Data
class GetUserEvent extends UserEvent {}

// Event for Updating User Data
class UpdateUserEvent extends UserEvent {
  final User user;

  const UpdateUserEvent(this.user);

  @override
  List<Object> get props => [user]; // Include user data in props for comparison
}

// Event for Creating a New User
class CreateUserEvent extends UserEvent {
  final User user;

  const CreateUserEvent(this.user);

  @override
  List<Object> get props => [user]; // Include user data in props for comparison
}
