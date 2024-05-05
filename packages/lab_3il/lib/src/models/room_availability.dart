import 'package:equatable/equatable.dart';

class RoomAvailability extends Equatable {
  final String room;
  final int level;
  final DateTime freeUntil;

  const RoomAvailability({
    required this.room,
    required this.level,
    required this.freeUntil,
  });

  @override
  List<Object> get props => [room, level, freeUntil];

  factory RoomAvailability.fromJson(Map<String, dynamic> json) {
    return RoomAvailability(
      room: json['room'],
      level: json['level'],
      freeUntil: DateTime.parse(json['free_until']),
    );
  }
}
