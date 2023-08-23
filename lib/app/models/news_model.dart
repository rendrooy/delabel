class NewsModel {
  NewsModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final Data data;

  NewsModel.fromJson(Map<String, dynamic> json) {
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
    required this.listImages,
    required this.id,
    required this.title,
    required this.content,
    required this.isShowed,
  });
  late final List<String> listImages;
  late final String id;
  late final String title;
  late final String content;
  late final bool isShowed;

  Data.fromJson(Map<String, dynamic> json) {
    listImages = List.castFrom<dynamic, String>(json['list_images']);
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isShowed = json['isShowed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['list_images'] = listImages;
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['isShowed'] = isShowed;
    return _data;
  }
}
