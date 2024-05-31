import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';

class TitledButtonList extends StatelessWidget {
  const TitledButtonList({
    super.key,
    required this.title,
    required this.rooms,
    this.onTap,
  });

  final String title;
  final List<RoomAvailability> rooms;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.grey,
        child: InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("test"),
                    ],
                  ),
                ),
                Icon(Icons.remove_red_eye_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
