import 'package:equatable/equatable.dart';

class Suggestion extends Equatable {
  final String mail;
  final String content;

  const Suggestion({
    required this.mail,
    required this.content,
  });

  @override
  List<Object> get props => [mail, content];

  toJson() {
    return {
      'mail': mail,
      'content': content,
    };
  }
}
