import 'package:equatable/equatable.dart';

class RoomUsage extends Equatable {
  final String room;
  final int totalTime;

  const RoomUsage({
    required this.room,
    required this.totalTime,
  });

  @override
  List<Object> get props => [room, totalTime];

  factory RoomUsage.fromJson(Map<String, dynamic> json) {
    return RoomUsage(
      room: json['room'],
      totalTime: json['total_time'],
    );
  }
}
