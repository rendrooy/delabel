// ignore_for_file: no_leading_underscores_for_local_identifiers

class FamilyModel {
  FamilyModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final Data data;

  FamilyModel.fromJson(Map<String, dynamic> json) {
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
    required this.statusAdm,
    required this.rt,
    required this.familyHead,
    required this.address,
    required this.statusDom,
    required this.id,
    required this.postalCode,
    required this.noKk,
    required this.noPbb,
  });
  late final bool statusAdm;
  late final int rt;
  late final String familyHead;
  late final String address;
  late final bool statusDom;
  late final String id;
  late final int postalCode;
  late final double noKk;
  late final String noPbb;

  Data.fromJson(Map<String, dynamic> json) {
    statusAdm = json['status_adm'];
    rt = json['rt'];
    familyHead = json['family_head'];
    address = json['address'];
    statusDom = json['status_dom'];
    id = json['id'];
    postalCode = json['postal_code'];
    noKk = json['no_kk'];
    noPbb = json['no_pbb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_adm'] = statusAdm;
    _data['rt'] = rt;
    _data['family_head'] = familyHead;
    _data['address'] = address;
    _data['status_dom'] = statusDom;
    _data['id'] = id;
    _data['postal_code'] = postalCode;
    _data['no_kk'] = noKk;
    _data['no_pbb'] = noPbb;
    return _data;
  }
}
