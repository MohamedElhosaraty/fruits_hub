
import 'dart:convert';

import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shered_preferences_singleton.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

UserEntity getUser(){
  var jsonString = Prefs.getString(kUserdata);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));

  return userEntity;
}