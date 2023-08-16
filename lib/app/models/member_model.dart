import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  String id;
  DataMemberModel data;

  MemberModel({required this.id, required this.data});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      data: DataMemberModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data': data.toJson(),
    };
  }
}

class DataMemberModel {
  String familyRelation;
  String profession;
  String address;
  int nik;
  String noKk;
  String bloodType;
  DateTime birthDate;
  String sex;
  String familyUuid;
  String name;
  int phoneNumber;
  String id;
  String religion;
  String relation;

  DataMemberModel({
    required this.familyRelation,
    required this.profession,
    required this.nik,
    required this.noKk,
    required this.address,
    required this.bloodType,
    required this.birthDate,
    required this.sex,
    required this.familyUuid,
    required this.name,
    required this.phoneNumber,
    required this.id,
    required this.religion,
    required this.relation,
  });

  factory DataMemberModel.fromJson(Map<String, dynamic> json) {
    return DataMemberModel(
      familyRelation: json['family_relation'],
      profession: json['profession'],
      nik: json['nik'],
      noKk: json['no_kk'] ?? "",
      address: json['address'],
      bloodType: json['blood_type'],
      birthDate: DateTime.fromMillisecondsSinceEpoch(
          (json['birth_date'] as Timestamp).seconds * 1000 +
              (json['birth_date'] as Timestamp).nanoseconds ~/ 1000000),
      sex: json['sex'],
      familyUuid: json['family_uuid'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      id: json['id'],
      religion: json['religion'],
      relation: json['relation'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family_relation': familyRelation,
      'profession': profession,
      'nik': nik,
      'address': address,
      'blood_type': bloodType,
      'birth_date': birthDate
          .toUtc()
          .toIso8601String(), // Konversi ke UTC DateTime dan format ISO 8601
      'sex': sex,
      'family_uuid': familyUuid,
      'name': name,
      'phone_number': phoneNumber,
      'id': id,
      'religion': religion,
    };
  }

  String encodeToJson() => json.encode(toJson());
}
