import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/func_util.dart';

class NewsServices {
  CollectionReference user = FirebaseFirestore.instance.collection('news');

  Future<void> insertData({required Map<String, dynamic> value}) {
    return user
        .add(value)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List<Map<String, dynamic>>> getAllData({
    int limit = 1000,
  }) async {
    List<Map<String, dynamic>> allData = [];
    try {
      QuerySnapshot querySnapshot = await user.limit(limit).get();
      print("querySnapshot length: ${querySnapshot.docs.length}");
      for (var doc in querySnapshot.docs) {
        allData.add({
          "id": doc.id,
          'data': doc.data(),
        });
      }
    } catch (e) {
      print("Error getting related family: $e");
    }
    return allData;
  }

  Future<void> updateData({required id, required data}) {
    return user
        .doc(id)
        .update(data)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteData({required id}) {
    return user
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<dynamic> getOne({required value, required field}) async {
    try {
      var querySnapshot = await user.where("$field", isEqualTo: "$value").get();
      logKey(querySnapshot.docs[0].data());
      var dataTemp = ({
        "id": querySnapshot.docs[0].id,
        'data': querySnapshot.docs[0].data()
      });
      return dataTemp;
    } catch (e) {
      return {"getOne Error": e.toString()};
    }
  }
}
