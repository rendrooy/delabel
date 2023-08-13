import 'package:cloud_firestore/cloud_firestore.dart';

import '../util/func_util.dart';

class VehicleServices {
  CollectionReference vehicle =
      FirebaseFirestore.instance.collection('vehicle');

  Future<void> insertData({required Map<String, dynamic> value}) {
    return vehicle
        .add(value)
        .then((value) => print("vehicle Added"))
        .catchError((error) => print("Failed to add vehicle: $error"));
  }

  Future<List<Map<String, dynamic>>> getFamilyVehicle({
    int limit = 1000,
    required dynamic value,
    required String field,
  }) async {
    List<Map<String, dynamic>> allData = [];

    try {
      QuerySnapshot querySnapshot =
          await vehicle.limit(limit).where(field, isEqualTo: value).get();

      // print("querySnapshot length: ${querySnapshot.docs.length}");

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

  Future<List> getAllData({
    limit = 1000,
  }) async {
    var allData = [];
    QuerySnapshot querySnapshot = await vehicle.limit(limit).get();

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
    return vehicle
        .doc(id)
        .update(data)
        .then((value) => print("vehicle Updated"))
        .catchError((error) => print("Failed to update vehicle: $error"));
  }

  Future<void> deleteData({required id}) {
    return vehicle
        .doc(id)
        .delete()
        .then((value) => print("vehicle Deleted"))
        .catchError((error) => print("Failed to delete vehicle: $error"));
  }

  Future<dynamic> getOne({required value, required field}) async {
    try {
      var querySnapshot =
          await vehicle.where("$field", isEqualTo: "$value").get();

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
