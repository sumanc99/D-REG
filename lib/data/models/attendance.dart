import 'package:d_reg/data/models/student.dart';
import 'package:isar/isar.dart';

part 'attendance.g.dart';

@Collection()
class Attendance{
 
  Id id = Isar.autoIncrement;

  @Index()
  String sId;

  @Index(caseSensitive: false)
  String status;

  @Index()
  DateTime createdAt;

  DateTime? updatedAt;
  
  final student = IsarLink<Student>(); // Attendance → one student
  
  Attendance({
    required this.sId,

    required this.status,
    
    required this.createdAt,

    this.updatedAt,
    
  });
}