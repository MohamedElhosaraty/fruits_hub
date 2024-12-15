import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/core/services/shered_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/services/data_service.dart';
import '../../domain/entites/user_entity.dart';

class AuthRepoImplemention extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImplemention(
      {required this.databaseService, required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(email: email, name: name, uId: user.uid);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);

      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      await deleteUser(user);
      // بعملها جوة ال exception لى انت مش عمله
      log("Exception in AuthRepoImplemention.createUserWithEmailAndPassword : ${e.toString()}");
      return left(
        ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);

      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);

      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      // بعملها جوة ال exception لى انت مش عمله
      log("Exception in AuthRepoImplemention.createUserWithEmailAndPassword : ${e.toString()}");
      return left(
        ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      var isUserExist = await databaseService.checkIsDataExist(
          path: BackendEndpoint.getUserData, docuementId: user.uid);
      if(isUserExist){
        await getUserData(uId: user.uid);
        await saveUserData(user: userEntity);
      }else{
        await addUserData(user: userEntity);
      }
      return right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);

      log("Exception in AuthRepoImplemention.createUserWithEmailAndPassword : ${e.toString()}");
      return left(
        ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      var isUserExist = await databaseService.checkIsDataExist(
          path: BackendEndpoint.getUserData, docuementId: user.uid);
      if(isUserExist){
        await getUserData(uId: user.uid);}
      else{
        await addUserData(user: userEntity);
        }

      return right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImplemention.createUserWithEmailAndPassword : ${e.toString()}");
      return left(
        ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      var isUserExist = await databaseService.checkIsDataExist(
          path: BackendEndpoint.getUserData, docuementId: user.uid);
      if(isUserExist){
        await getUserData(uId: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
      return right(
        userEntity,
      );
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImplemention.createUserWithEmailAndPassword : ${e.toString()}");
      return left(
        ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithTwitter() async {
    try {
      var user = await firebaseAuthServices.signInWithTwitter();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      var isUserExist = await databaseService.checkIsDataExist(
          path: BackendEndpoint.getUserData, docuementId: user.uid);
      if(isUserExist){
        await getUserData(uId: user.uid);
      }else{
        await addUserData(user: UserModel.fromFirebaseUser(user));
      }
      return right(
        userEntity,
      );
    } catch (e) {
      log("Exception in AuthRepoImplemention.signInWithTwitter : ${e.toString()}");
      return left(
        ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.addUserData,
          data: UserModel.fromEntity(user).toMap(),
          docuementId: user.uId);
    } catch (e) {
      log("Exception in AuthRepoImplemention.addUserData : ${e.toString()}");
      throw ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.');
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    try {
      var userData = await databaseService.getData(
          path: BackendEndpoint.getUserData, docuementId: uId);
      return UserModel.fromJson(userData);
    } catch (e) {
      log("Exception in AuthRepoImplemention.getUserData : ${e.toString()}");
      throw ServerFailure('لقد حدث خطأ. الرجاء المحاولة مرة أخرى.');
    }
  }

  @override
  Future saveUserData({required UserEntity user}) async{
     var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
     await Prefs.setString(kUserdata, jsonData);
  }
}
