import 'package:isar/isar.dart';

part 'history.g.dart';

@Collection()
class History{
 
  Id id = Isar.autoIncrement;
  
  @Index()
  int maleCount;

  @Index()
  int femaleCount;

  @Index()
  DateTime createdAt;
  
  DateTime? updatedAt;
  
  History({
  
    required this.maleCount,

    required this.femaleCount,

    required this.createdAt,

    this.updatedAt,
    
  });
}