import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';

import '../../utils/backend_endpoint.dart';

class OrderRepoImpl implements OrdersRepo {

  final DatabaseService databaseService;

  OrderRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.addOrder,
          data: OrderModel.fromEntity(order).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}
