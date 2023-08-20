// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:uuid/uuid.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final DataUserModel data;

  UserModel.fromJson(Map json) {
    id = json['id'];
    data = DataUserModel.fromJson(json['data']);
  }

  Map toJson() {
    final _data = {};
    _data['id'] = id;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataUserModel {
  DataUserModel({
    required this.memberId,
    required this.isAdmin,
    required this.role,
    required this.permissions,
    required this.id,
    required this.email,
  });
  late final String memberId;
  late final bool isAdmin;
  late final String role;
  late final Permissions permissions;
  late final String id;
  late final String email;

  DataUserModel.fromJson(Map json) {
    memberId = json['member_id'];
    isAdmin = json['is_admin'] ?? false;
    role = json['role'] ?? "Member";
    permissions = Permissions.fromJson(json['permissions']);
    id = json['id'] ?? const Uuid().v4();
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['member_id'] = memberId;
    _data['is_admin'] = isAdmin;
    _data['role'] = role;
    _data['permissions'] = permissions.toJson();
    _data['id'] = id;
    _data['email'] = email;
    return _data;
  }
}

class Permissions {
  Permissions({
    required this.masterMember,
    required this.masterFamilies,
  });
  late final MasterMember masterMember;
  late final MasterFamilies masterFamilies;

  Permissions.fromJson(Map json) {
    masterMember = MasterMember.fromJson(json['master_member']);
    masterFamilies = MasterFamilies.fromJson(json['master_families']);
  }

  Map toJson() {
    final _data = {};
    _data['master_member'] = masterMember.toJson();
    _data['master_families'] = masterFamilies.toJson();
    return _data;
  }
}

class MasterMember {
  MasterMember({
    required this.read,
    required this.update,
    required this.create,
    required this.delete,
  });
  late final bool read;
  late final bool update;
  late final bool create;
  late final bool delete;

  MasterMember.fromJson(Map json) {
    read = json['read'] ?? false;
    update = json['update'] ?? false;
    create = json['create'] ?? false;
    delete = json['delete'] ?? false;
  }

  Map toJson() {
    final _data = {};
    _data['read'] = read;
    _data['update'] = update;
    _data['create'] = create;
    _data['delete'] = delete;
    return _data;
  }
}

class MasterFamilies {
  MasterFamilies({
    required this.read,
    required this.update,
    required this.create,
    required this.delete,
  });
  late final bool read;
  late final bool update;
  late final bool create;
  late final bool delete;

  MasterFamilies.fromJson(Map json) {
    read = json['read'] ?? false;
    update = json['update'] ?? false;
    create = json['create'] ?? false;
    delete = json['delete'] ?? false;
  }

  Map toJson() {
    final _data = {};
    _data['read'] = read;
    _data['update'] = update;
    _data['create'] = create;
    _data['delete'] = delete;
    return _data;
  }
}
