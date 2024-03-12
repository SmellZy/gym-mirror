import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';

class GetUser {

  final UserRepository repository;

  GetUser(this.repository);

  Future<User> call() {
    return repository.getUser();
  }
}