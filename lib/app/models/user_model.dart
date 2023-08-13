// ignore_for_file: no_leading_underscores_for_local_identifiers

class UserModel {
  UserModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final Data data;

  UserModel.fromJson(Map<String, dynamic> json) {
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
    required this.memberId,
    required this.nik,
    required this.role,
    required this.email,
  });
  late final String memberId;
  late final String nik;
  late final String role;
  late final String email;

  Data.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    nik = json['nik'];
    role = json['role'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['member_id'] = memberId;
    _data['nik'] = nik;
    _data['role'] = role;
    _data['email'] = email;
    return _data;
  }
}
