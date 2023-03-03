import 'package:my_app/features/domain/entities/example.dart';

class ExampleModel extends Example {
  ExampleModel({
    required String login,
    required String id,
    required String avatar_url,
    required String url
  }): super(
    id: id,
    login: login,
    avatar_url: avatar_url,
    url: url
  );

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      ExampleModel(
        id: json['id'],
        login: json['login'],
        avatar_url: json['avatar_url'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'login': login,
    'avatar_url': avatar_url,
    'url': url,
  };
}