import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
// isar models schemas
import 'package:d_reg/data/db/isar_schemas.dart';
// use to get location where to store data
import 'package:path_provider/path_provider.dart';

class IsarService {
  // creating the internal private constructor
  IsarService._internal();

  // make the class base on singleton style
  // that is  // Private constructor for singleton
  static final IsarService _instance = IsarService._internal();

  // allow user to get same copy overtime
  // also
  // Ensures only one instance of IsarService is used throughout the app
  factory IsarService() => _instance;

  // Holds the Isar database instance
  Isar? _isar;


  // set the isar and check if is already set
  Future<void> openIsar() async{

    if(_isar != null) return;

    final dir = await getApplicationDocumentsDirectory();

    try{
      _isar = await Isar.open(
        [
        TeacherSchema,
        StudentSchema,
        AttendanceSchema,
        HistorySchema
        ],
        directory:dir.path,
        inspector: kDebugMode,
      );
    }catch(e){
      throw Exception("Failed to Initialize Isar: $e");
    }
  }
  

  Future<bool> hasTeacher() async {
    if (_isar == null) {
      await openIsar(); // ensures it's ready
    }
    final count = await _isar!.teachers.count();
    return count > 0;
  }


  // give access to the isar database for CRUD operations
 Isar get isar{
   if(_isar == null){
     throw Exception("Isar is not initialized. Call openIsar() first.");
   }
   return _isar!;
 }
}