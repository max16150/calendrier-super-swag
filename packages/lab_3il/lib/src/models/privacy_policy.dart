import 'package:equatable/equatable.dart';

class PrivacyPolicy extends Equatable {
  final String content;
  final DateTime updatedAt;

  const PrivacyPolicy({
    required this.content,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [content, updatedAt];

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicy(
      content: json['content'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
