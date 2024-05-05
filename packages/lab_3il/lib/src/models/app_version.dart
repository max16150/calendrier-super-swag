import 'package:equatable/equatable.dart';

class AppVersion extends Equatable {
  final String version;
  final DateTime updatedAt;

  const AppVersion({
    required this.version,
    required this.updatedAt,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) {
    return AppVersion(
      version: json['version'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object> get props => [version, updatedAt];
}
