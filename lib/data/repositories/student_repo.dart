import 'dart:math';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:d_reg/data/models/student.dart';
import 'package:uuid/uuid.dart';

class StudentRepository{

  final Isar isar;

  // List<Student> students = [];

  StudentRepository({ required this.isar});

  // Load all Students
  Future<List<Student>> loadStudents()async{

      try {

        // assigning the fetch result
       return  await isar.students.where().findAll();
      

      } catch (e){
        return [];
      }
  }

  Future<void> addStudent()async{

      try {

        Uuid uuid = Uuid();
      
      // final businessId = uuid.v4();
      // await isar.writeTxn(()async{
      //   await isar.businessTypes.put(businessType);
      // });

      

      } catch (e){
         debugPrint('Error adding business type: $e');
      }
  }



  Future<void> addDommyStudents()async{

      try {


        List<Student> students = [
          Student(
            sId: Uuid().v4(), 
            firstName: "sulaiman", 
            lastName: "saleh yahaya", 
            gender: "male", 
            createdAt: DateTime.now()
          ),
          Student(
            sId: Uuid().v4(), 
            firstName: "annuri", 
            lastName: "annuri", 
            gender: "male", 
            createdAt: DateTime.now()
          ),
          Student(
            sId: Uuid().v4(), 
            firstName: "jane", 
            lastName: "smith", 
            gender: "female", 
            createdAt: DateTime.now()
          ),
          Student(
            sId: Uuid().v4(), 
            firstName:"sharlock", 
            lastName: "holmes", 
            gender: "male", 
            createdAt: DateTime.now()
          ),
          Student(
            sId: Uuid().v4(), 
            firstName: "fatima", 
            lastName: "muhammad", 
            gender: "male", 
            createdAt: DateTime.now()
          ),
        ];
      
      await isar.writeTxn(()async{
        await isar.students.putAll(students);
      });

      

      } catch (e){
         debugPrint('Error adding business type: $e');
      }
  }


}