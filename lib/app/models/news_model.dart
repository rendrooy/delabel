// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class NewsModel {
  NewsModel({
    required this.id,
    required this.data,
  });
  late final String id;
  late final DataNewsModel data;

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = DataNewsModel.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataNewsModel {
  DataNewsModel({
    required this.listImages,
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.isShowed,
  });
  late final List<String> listImages;
  late final String id;
  late final String title;
  late final String content;
  late final DateTime createdAt;
  late final bool isShowed;

  DataNewsModel.fromJson(Map<String, dynamic> json) {
    listImages = List.castFrom<dynamic, String>(json['list_images']);
    id = json['id'] ?? const Uuid().v4();
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'] is DateTime
        ? json['created_at']
        : json['created_at'] is String
            ? DateTime.parse(json['created_at'])
            : DateTime.fromMillisecondsSinceEpoch(
                (json['created_at'] as Timestamp).seconds * 1000 +
                    (json['created_at'] as Timestamp).nanoseconds ~/ 1000000);
    //  is String
    //     ?
    //     : DateTime.now();

    isShowed = json['isShowed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['list_images'] = listImages;
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['isShowed'] = isShowed;
    _data['created_at'] = createdAt
        .toUtc()
        .toIso8601String(); // Konversi ke UTC DateTime dan format ISO 8601
    return _data;
  }
}
