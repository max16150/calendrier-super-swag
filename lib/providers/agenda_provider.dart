import 'package:flutter/material.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:triilab/services/storage_service.dart';

class AgendaProvider extends ChangeNotifier {
  ClassGroup? _selectedGroup;
  ClassGroup? get selectedGroup => _selectedGroup;

  AgendaProvider({required ClassGroup? selectedGroup}) {
    _selectedGroup = selectedGroup;
  }

  Future<void> setSelectedGroup(ClassGroup group) async {
    _selectedGroup = group;
    await StorageService().saveString(StorageKeyString.selectedAgenda, group.id.toString());
    notifyListeners();
  }
}
