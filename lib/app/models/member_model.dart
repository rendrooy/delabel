// ignore_for_file: no_leading_underscores_for_local_identifiers

class MemberModel {
  MemberModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final Data data;

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
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
    required this.profession,
    required this.address,
    required this.education,
    required this.birthDate,
    required this.sex,
    required this.relation,
    required this.religion,
    required this.nik,
    required this.surname,
    required this.organization,
    required this.name,
    required this.phoneNumber,
    required this.noKk,
  });
  late final String profession;
  late final String address;
  late final String education;
  late final String birthDate;
  late final String sex;
  late final String relation;
  late final String religion;
  late final String nik;
  late final String surname;
  late final bool organization;
  late final String name;
  late final String phoneNumber;
  late final String noKk;

  Data.fromJson(Map<String, dynamic> json) {
    profession = json['profession'] ?? "";
    address = json['address'] ?? "";
    education = json['education'] ?? "";
    birthDate = json['birth_date'] ?? "";
    sex = json['sex'] ?? "";
    relation = json['relation'] ?? "";
    religion = json['religion'] ?? "";
    nik = json['nik'] ?? "";
    surname = json['surname'] ?? "";
    organization = json['organization'] ?? false;
    name = json['name'] ?? "";
    phoneNumber = json['phone_number'] ?? "";
    noKk = json['no_kk'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profession'] = profession;
    _data['address'] = address;
    _data['education'] = education;
    _data['birth_date'] = birthDate;
    _data['sex'] = sex;
    _data['relation'] = relation;
    _data['religion'] = religion;
    _data['nik'] = nik;
    _data['surname'] = surname;
    _data['organization'] = organization;
    _data['name'] = name;
    _data['phone_number'] = phoneNumber;
    _data['no_kk'] = noKk;
    return _data;
  }
}
