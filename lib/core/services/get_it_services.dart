import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_implemention.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../repos/orders_repo/order_repo_impl.dart';
import 'data_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl( databaseService: getIt.get<DatabaseService>()));

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImplemention(firebaseAuthServices: getIt<FirebaseAuthServices>(),
        databaseService: getIt<DatabaseService>(),),);


  getIt.registerSingleton<OrdersRepo>(
      OrderRepoImpl( getIt<DatabaseService>()),
  );
}
