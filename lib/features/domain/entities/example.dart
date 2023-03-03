import 'package:equatable/equatable.dart';

class Example extends Equatable {
  final String id;
  final String login;
  final String avatar_url;
  final String url;

  Example({
    required this.login,
    required this.id,
    required this.avatar_url,
    required this.url,
  });

  @override
  List<Object?> get props => [
    id,
    login,
    avatar_url,
    url,
  ];
}