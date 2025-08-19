import 'package:d_reg/data/models/attendance.dart';
import 'package:isar/isar.dart';

part 'student.g.dart';

@Collection()
class Student {
 
  Id id = Isar.autoIncrement;

  @Index()
  String sId;

  @Index(caseSensitive: false)
  String firstName;
  
  @Index(caseSensitive: false)
  String lastName;

  @Index(caseSensitive: false)
  String gender;

  @Index()
  DateTime createdAt;
 
  DateTime? updatedAt;
  
  final attendances = IsarLinks<Attendance>(); // One student → many attendances
    
  Student({
    required this.sId,

    required this.firstName,

    required this.lastName,

    required this.gender,

    required this.createdAt,

    this.updatedAt,
    
  });
}