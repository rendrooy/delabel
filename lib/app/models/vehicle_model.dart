// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:uuid/uuid.dart';

class VehicleModel {
  VehicleModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final DataVehicleModel data;

  VehicleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = DataVehicleModel.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataVehicleModel {
  DataVehicleModel({
    required this.familyId,
    required this.product,
    required this.id,
    required this.type,
    required this.brand,
    required this.registrationNo,
  });
  late final String familyId;
  late final String product;
  late final String id;
  late final String type;
  late final String brand;
  late final String registrationNo;

  DataVehicleModel.fromJson(Map<String, dynamic> json) {
    familyId = json['family_id'];
    product = json['product'];
    id = json['id'] ?? const Uuid().v4();
    type = json['type'];
    brand = json['brand'];
    registrationNo = json['registration_no'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['family_id'] = familyId;
    _data['product'] = product;
    _data['id'] = id;
    _data['type'] = type;
    _data['brand'] = brand;
    _data['registration_no'] = registrationNo;
    return _data;
  }
}
