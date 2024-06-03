
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
    final existingUserKey = userBox.keys.firstWhereOrNull((key) {
      final existingUser = userBox.get(key);
      return existingUser != null && existingUser.id == user.id;
    });

    if (existingUserKey != null) {
      await userBox.put(existingUserKey, user);
    } else {
      log('User not found in local storage');
    }
  }

  void createUser(UserModel user) {
    userBox.add(user);
  }
}