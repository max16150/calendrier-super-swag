import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';

class Event extends Equatable {
  const Event(this.eventName, this.from, this.to, this.background, this.isAllDay, this.rooms, this.course);

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
  final List<String> rooms;
  final Course course;

  @override
  List<Object?> get props => [eventName, from, to, background, isAllDay, rooms];
}
