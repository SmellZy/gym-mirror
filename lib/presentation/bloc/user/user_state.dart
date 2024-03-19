part of 'user_bloc.dart';
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

// Initial State
class UserInitial extends UserState {}

// Loading States
class UserLoading extends UserState {}

// Loaded State
class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

// Error State Handling
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
