import 'package:isar/isar.dart';

part 'teacher.g.dart';

@Collection()
class Teacher{
 
  Id id = Isar.autoIncrement;

  @Index()
  String tId;

  @Index(caseSensitive: false)
  String firstName;
  
  @Index(caseSensitive: false)
  String lastName;

  @Index(caseSensitive: false)
  String className;

  @Index()
  String password;

  @Index()
  DateTime createdAt;
 
  DateTime? updatedAt;
  
  Teacher({
    required this.tId,

    required this.firstName,

    required this.lastName,

    required this.className,

    required this.password,

    required this.createdAt,

    this.updatedAt,
    
  });
}