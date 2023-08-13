// ignore_for_file: no_leading_underscores_for_local_identifiers

class OrganizationModel {
  OrganizationModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final Data data;

  OrganizationModel.fromJson(Map<String, dynamic> json) {
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
    required this.nik,
    required this.period,
    required this.levelOrg,
    required this.name,
    required this.nameOrg,
    required this.typeOrg,
    required this.phoneNumber,
    required this.position,
  });
  late final String nik;
  late final List<String> period;
  late final String levelOrg;
  late final String name;
  late final String nameOrg;
  late final String typeOrg;
  late final String phoneNumber;
  late final String position;

  Data.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    period = List.castFrom<dynamic, String>(json['period']);
    levelOrg = json['level_org'];
    name = json['name'];
    nameOrg = json['name_org'];
    typeOrg = json['type_org'];
    phoneNumber = json['phone_number'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nik'] = nik;
    _data['period'] = period;
    _data['level_org'] = levelOrg;
    _data['name'] = name;
    _data['name_org'] = nameOrg;
    _data['type_org'] = typeOrg;
    _data['phone_number'] = phoneNumber;
    _data['position'] = position;
    return _data;
  }
}
