import 'package:gym_mirror/data/datasources/user_local_datasource.dart';
import 'package:gym_mirror/data/models/user/user_model.dart';
import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDatasource localDatasource;

  UserRepositoryImpl({required this.localDatasource});

  @override
  Future<void> createUser(User user) async{
    final userModel = UserModel.fromEntity(user);
    localDatasource.createUser(userModel);
  }

  @override
Future<User> getUser() async {
  final userModels = localDatasource.getUser();
    return userModels.first.toEntity();
}

  @override
  Future<void> updateUser(User user) async{
    final userModel = UserModel.fromEntity(user);
    localDatasource.updateUser(userModel);
  }

}