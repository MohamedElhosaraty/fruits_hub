import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_implemention.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import 'data_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImplemention(firebaseAuthServices: getIt<FirebaseAuthServices>(),
        databaseService: getIt<DatabaseService>(),),);
}
