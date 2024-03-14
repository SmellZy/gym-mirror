
import 'dart:developer';

import 'package:gym_mirror/data/models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';

class UserLocalDatasource {
  final Box<UserModel> userBox;

  UserLocalDatasource({required this.userBox});

  List<UserModel> getUser() {
    return userBox.values.toList();
  }

  // void updateUser(UserModel user) {}
  Future<void> updateUser(UserModel user) async {
    final existingUser = userBox.values.firstWhereOrNull((u) => u.id == user.id);
    if (existingUser != null) {
      await userBox.putAt(existingUser.id, user);
    } else {
      log('User not found in local storage');
    }
  }

  void createUser(UserModel user) {
    userBox.add(user);
  }
}