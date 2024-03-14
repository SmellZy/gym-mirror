import 'package:gym_mirror/domain/entities/user.dart';

abstract class UserRepository {
  Future<User>getUser();
  Future<void>updateUser(User user);
  Future<void>createUser(User user);
}