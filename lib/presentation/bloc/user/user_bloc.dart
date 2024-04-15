import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<GetUserEvent>(_onGetUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<CreateUserEvent>(_onCreateUser);
  }

  Future<void> _onGetUser(GetUserEvent event, Emitter<UserState> emit) async {
    try {
      if (state is! UserLoaded) {
        emit(UserLoading());
      }
      final user = await userRepository.getUser();
      emit(UserLoaded(user));
    } catch (error) {
      emit(UserError(error.toString()));
    }
  }

  Future<void> _onUpdateUser(UpdateUserEvent event, Emitter<UserState> emit) async {
    try {
      if (state is! UserLoaded) {
        emit(UserLoading());
      }
      await userRepository.updateUser(event.user);
      final user = await userRepository.getUser();
      emit(UserLoaded(user));
    } catch (error) {
      emit(UserError(error.toString()));
    }
  }

  Future<void> _onCreateUser(CreateUserEvent event, Emitter<UserState> emit) async {
    try {
      if (state is! UserLoaded) {
        emit(UserLoading());
      }
      await userRepository.createUser(event.user);
      final user = await userRepository.getUser();
      emit(UserLoaded(user));
    } catch (error) {
      emit(UserError(error.toString()));
    }
  }
}
