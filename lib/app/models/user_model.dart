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

  Data.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    isAdmin = json['is_admin'];
    role = json['role'];
    permissions = Permissions.fromJson(json['permissions']);
    id = json['id'];
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

  Permissions.fromJson(Map<String, dynamic> json) {
    masterMember = MasterMember.fromJson(json['master_member']);
    masterFamilies = MasterFamilies.fromJson(json['master_families']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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

  MasterMember.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    update = json['update'];
    create = json['create'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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

  MasterFamilies.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    update = json['update'];
    create = json['create'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['read'] = read;
    _data['update'] = update;
    _data['create'] = create;
    _data['delete'] = delete;
    return _data;
  }
}
