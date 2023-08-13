// ignore_for_file: no_leading_underscores_for_local_identifiers

class VehicleModel {
  VehicleModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final Data data;

  VehicleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.noPol,
    required this.brandName,
    required this.noKk,
    required this.type,
  });
  late final String noPol;
  late final String brandName;
  late final String noKk;
  late final String type;

  Data.fromJson(Map<String, dynamic> json) {
    noPol = json['no_pol'];
    brandName = json['brand_name'];
    noKk = json['no_kk'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['no_pol'] = noPol;
    _data['brand_name'] = brandName;
    _data['no_kk'] = noKk;
    _data['type'] = type;
    return _data;
  }
}
