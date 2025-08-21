import 'dart:math';

import 'package:isar/isar.dart';
import 'package:d_reg/data/models/teacher.dart';

class TeacherRepository { 
  // db connection and functions simple interface
  final Isar isar;

  // repo constructor
  TeacherRepository({required this.isar});

  Future<void> registerTeacher(Teacher teacher)async{

    await isar.writeTxn(
      ()async{
        await isar.teachers.put(teacher);
      }
    );
  }
  Future<String> retrivePassword()async{
    String password = "";

    final teacherCount = await isar.teachers.count();

    Teacher? onlyTeacher;
    
    if (teacherCount == 1) {
      onlyTeacher = await isar.teachers.where().findFirst();

      if(onlyTeacher!=null){
         password = onlyTeacher.password;
      }
      
    }else{
      password = "";
    }
   

    return password;
  }


    /// Generates a user-friendly, unique Teacher ID string.
    ///
    /// The format is: `T-YYYYMMDD-XXXXXXX`
    ///
    /// - `YYYYMMDD`: current date (sortable & traceable)
    /// - `XXXXXXX`: 7-character random alphanumeric code (A–Z, 0–9)
    ///   - Total possible combinations: 36⁷ = ~78.3 billion
    ///
    /// Example output: `T-20250709-A7X9Z3K`
    String generateTeacherId() {
      
      final now = DateTime.now();
      final date = "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";
      final random = Random();
      const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final suffix = List.generate(7, (_) => chars[random.nextInt(chars.length)]).join();
      return 'T-$date-$suffix';
    }
}