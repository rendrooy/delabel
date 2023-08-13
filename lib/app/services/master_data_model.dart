import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/func_util.dart';

class MasterData {
  CollectionReference masterData =
      FirebaseFirestore.instance.collection('master_data');

  Future<void> insertData({required Map<String, dynamic> value}) {
    return masterData
        .add(value)
        .then((value) => logKey("User Added"))
        .catchError((error) => logKey("Failed to add user: $error"));
  }

  Future<List> getAllData({
    limit = 1000,
  }) async {
    var allData = [];
    QuerySnapshot querySnapshot = await masterData.limit(limit).get();

    logKey(querySnapshot.docs.length);
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      allData.add({
        "id": querySnapshot.docs[i].id,
        'data': querySnapshot.docs[i].data()
      });
    }
    return allData;
  }

  Future<List> getRelatedFamily({
    limit = 1000,
    no_kk,
  }) async {
    var allData = [];
    QuerySnapshot querySnapshot =
        await masterData.limit(limit).where("no_kk", isEqualTo: no_kk).get();

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
    return masterData
        .doc(id)
        .update(data)
        .then((value) => logKey("User Updated"))
        .catchError((error) => logKey("Failed to update user: $error"));
  }

  Future<void> deleteData({required id}) {
    return masterData
        .doc(id)
        .delete()
        .then((value) => logKey("User Deleted"))
        .catchError((error) => logKey("Failed to delete user: $error"));
  }

  Future<dynamic> getOne({required value, required field}) async {
    try {
      var querySnapshot =
          await masterData.where("$field", isEqualTo: "$value").get();
      logKey("value", querySnapshot.docs.length);

      var dataTemp = ({
        "id": querySnapshot.docs[0].id,
        'data': querySnapshot.docs[0].data()
      });
      return dataTemp;
    } catch (e) {
      return {"getOne Error": e.toString()};
    }
  }

  // Future<void>() async{
  //   try {

  //   } catch (e) {
  //   }
  // }

  Future<dynamic> getUnrelatedMember({required value, required field}) async {
    try {
      var querySnapshot = await masterData
          .where("$field", isEqualTo: "$value")
          .where('no_kk', isNull: true)
          .get();
      logKey("value", querySnapshot.docs.length);

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
