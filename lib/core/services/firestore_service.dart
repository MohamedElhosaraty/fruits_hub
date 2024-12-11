import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docuementId}) async {
    if(docuementId != null){
      await firestore.collection(path).doc(docuementId).set(data);
    }else{
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,String? docuementId, Map<String, dynamic>? query}) async {
    if(docuementId != null){
      var data = await firestore.collection(path).doc(docuementId).get();
      return data.data();
    }else{
      // لو مش معايا ال id  بجيبهم كلهم
      Query<Map<String, dynamic>> data = await firestore.collection(path);
      if(query != null){
        if(query['orderBy'] != null){
           var orderByFeild = query['orderBy'];
           var descending = query['descending'];
           data = data.orderBy(orderByFeild,descending: descending);
        }
        if(query['limit'] != null){
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }

  }

  @override
  Future<bool> checkIsDataExist({required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
}
