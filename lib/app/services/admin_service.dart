import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/func_util.dart';

class AdminModel {
  CollectionReference admin = FirebaseFirestore.instance.collection('admin');

  Future<void> insertData({required Map<String, dynamic> value}) {
    return admin
        .add(value)
        .then((value) => logKey("Admin Added"))
        .catchError((error) => logKey("Failed to add user: $error"));
  }

  Future<List> getAllData({
    limit = 1000,
  }) async {
    var allData = [];
    QuerySnapshot querySnapshot = await admin.limit(limit).get();

    logKey(querySnapshot.docs.length);
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      allData.add({
        "id": querySnapshot.docs[i].id,
        'data': querySnapshot.docs[i].data()
      });
    }

    return allData;
  }

  Future<void> updateData({required id, required data}) {
    return admin
        .doc(id)
        .update(data)
        .then((value) => logKey("Admin Updated"))
        .catchError((error) => logKey("Failed to update user: $error"));
  }

  Future<void> deleteData({required id}) {
    return admin
        .doc(id)
        .delete()
        .then((value) => logKey("Admin Deleted"))
        .catchError((error) => logKey("Failed to delete user: $error"));
  }

  Future<dynamic> getOne({required value, required field}) async {
    try {
      var querySnapshot =
          await admin.where("$field", isEqualTo: "$value").get();

      var dataTemp = ({
        "id": querySnapshot.docs[0].id,
        'data': querySnapshot.docs[0].data()
      });
      logKey("value", dataTemp);
      return dataTemp;
    } catch (e) {
      return {"getOne Error": e.toString()};
    }
  }
}
