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
    required this.id,
    required this.title,
    required this.content,
  });
  late final String id;
  late final String title;
  late final String content;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    return _data;
  }
}
