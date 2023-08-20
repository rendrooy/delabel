import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/func_util.dart';

class MemberService {
  CollectionReference members =
      FirebaseFirestore.instance.collection('members');

  Future<void> insertData({required Map<String, dynamic> value}) {
    return members
        .add(value)
        .then((value) => logKey("User Added"))
        .catchError((error) => logKey("Failed to add user: $error"));
  }

  Future<void> updateData({required id, required data}) {
    return members
        .doc(id)
        .update(data)
        .then((value) => logKey("User Updated"))
        .catchError((error) => logKey("Failed to update user: $error"));
  }

  Future<void> deleteData({required id}) {
    return members
        .doc(id)
        .delete()
        .then((value) => logKey("User Deleted"))
        .catchError((error) => logKey("Failed to delete user: $error"));
  }

  Future<List> getAllData({limit = 1000, find}) async {
    var allData = [];
    if (find != null) {
      logKey(find);
      QuerySnapshot querySnapshot = await members
          .limit(limit)
          .where("${find['field']}", isGreaterThan: "${find['value']}")
          .get();
      for (var i = 0; i < querySnapshot.docs.length; i++) {
        allData.add({
          "id": querySnapshot.docs[i].id,
          'data': querySnapshot.docs[i].data()
        });
      }
    } else {
      QuerySnapshot querySnapshot = await members.limit(limit).get();
      for (var i = 0; i < querySnapshot.docs.length; i++) {
        allData.add({
          "id": querySnapshot.docs[i].id,
          'data': querySnapshot.docs[i].data()
        });
      }
    }

    return allData;
  }

  Future<List<Map<String, dynamic>>> getRelatedFamily({
    int limit = 1000,
    required dynamic value,
    required String field,
  }) async {
    List<Map<String, dynamic>> allData = [];

    try {
      QuerySnapshot querySnapshot =
          await members.limit(limit).where(field, isEqualTo: value).get();

      print("querySnapshot length: ${querySnapshot.docs.length}");
      print("querySnapshot length: ${members.path}");

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

  Future<List<Map<String, dynamic>>> getMemberHasNotFamily({
    int limit = 1000,
    // required dynamic value,
    // required String field,
  }) async {
    List<Map<String, dynamic>> allData = [];

    try {
      QuerySnapshot querySnapshot =
          await members.limit(limit).where("family_id", isEqualTo: "").get();

      // print("querySnapshot length: ${querySnapshot.docs.length}");
      // print("querySnapshot length: ${members.path}");

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

  Future<dynamic> getOne({required value, required field}) async {
    try {
      var querySnapshot = await members.where(field, isEqualTo: "$value").get();
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

  Future<dynamic> getUnrelatedMember({required value, required field}) async {
    try {
      var querySnapshot = await members
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
