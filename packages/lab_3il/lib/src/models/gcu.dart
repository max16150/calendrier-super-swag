import 'package:equatable/equatable.dart';

class Gcu extends Equatable {
  final String content;
  final DateTime updatedAt;

  const Gcu({
    required this.content,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [content, updatedAt];

  factory Gcu.fromJson(Map<String, dynamic> json) {
    return Gcu(
      content: json['content'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
