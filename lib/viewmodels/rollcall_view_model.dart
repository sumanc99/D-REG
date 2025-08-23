
import 'package:d_reg/data/repositories/student_repo.dart';
import 'package:flutter/foundation.dart';

class RollcallViewModel extends ChangeNotifier{
  late StudentRepository _repo;

  RollcallViewModel({required StudentRepository repo}) : _repo = repo;

  bool _loading = false;

  // getter for loading
  bool get loading => _loading;

  void _setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void addDummyStudents(){
    _repo.addDommyStudents();
  }
}