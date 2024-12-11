// هنا بحط كل حاجه انا هستخدمها فى ال firestore

abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docuementId});

  Future<dynamic> getData(
      {required String path,  String? docuementId,
      Map<String, dynamic>? query,
      }
      );

  Future<bool> checkIsDataExist({required String path, required String docuementId});
}
