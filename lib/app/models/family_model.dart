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
    required this.addressKk,
    required this.statusDom,
    required this.noKk,
    required this.postalCode,
    required this.noPbb,
  });
  late final bool statusAdm;
  late final String rt;
  late final String addressKk;
  late final bool statusDom;
  late final String noKk;
  late final String postalCode;
  late final String noPbb;

  Data.fromJson(Map<String, dynamic> json) {
    statusAdm = json['status_adm'];
    rt = json['rt'];
    addressKk = json['address_kk'];
    statusDom = json['status_dom'];
    noKk = json['no_kk'];
    postalCode = json['postal_code'];
    noPbb = json['no_pbb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_adm'] = statusAdm;
    _data['rt'] = rt;
    _data['address_kk'] = addressKk;
    _data['status_dom'] = statusDom;
    _data['no_kk'] = noKk;
    _data['postal_code'] = postalCode;
    _data['no_pbb'] = noPbb;
    return _data;
  }
}
