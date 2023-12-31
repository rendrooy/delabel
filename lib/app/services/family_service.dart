import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/func_util.dart';

class FamilyService {
  CollectionReference family =
      FirebaseFirestore.instance.collection('families');

  Future<void> insertData({required Map<String, dynamic> value}) {
    return family
        .add(value)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List> getAllData({
    limit = 1000,
  }) async {
    var allData = [];
    QuerySnapshot querySnapshot = await family.limit(limit).get();

    logKey(querySnapshot.docs.length);
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      allData.add({
        "id": querySnapshot.docs[i].id,
        'data': querySnapshot.docs[i].data()
      });
    }

    return allData;
  }

  Future<List> getAllDataFilter({
    limit = 1000,
    required field,
    required value,
  }) async {
    var allData = [];
    QuerySnapshot querySnapshot =
        await family.limit(limit).where(field, isEqualTo: value).get();

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
    return family
        .doc(id)
        .update(data)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteData({required id}) {
    return family
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<dynamic> getOne({required value, required field}) async {
    try {
      var querySnapshot =
          await family.where("$field", isEqualTo: "$value").get();

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
