import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Future<void> call(User user) {
    return repository.createUser(user);
  }
}