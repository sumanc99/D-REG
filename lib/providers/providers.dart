// import 'package:flutter/material.dart';
import 'package:d_reg/data/db/isar_db_connection.dart';
import 'package:d_reg/data/repositories/student_repo.dart';
import 'package:d_reg/data/repositories/teacher_repo.dart';
import 'package:d_reg/viewmodels/rollcall_view_model.dart';
import 'package:d_reg/viewmodels/teacher_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers(IsarService isarService){
  return [

        Provider<IsarService>.value(value: isarService),

        // Teacher providers
        // repositories
        ProxyProvider<IsarService, TeacherRepository>(

          update: (_,isarService,_) => TeacherRepository(isar: isarService.isar),
        ),
        // viewModel
        ChangeNotifierProxyProvider<TeacherRepository, TeacherViewModel>(
          create: (_)=>TeacherViewModel(repo: TeacherRepository(isar: isarService.isar)), 
          update: (_,repo,_)=>TeacherViewModel(repo: repo)
        ),
        
        // student Providers
        // repositories
        ProxyProvider<IsarService, StudentRepository>(

          update: (_,isarService,_) => StudentRepository(isar: isarService.isar),
        ),
        //viewmodels
        ChangeNotifierProxyProvider<StudentRepository, RollcallViewModel>(
          create: (_)=>RollcallViewModel(repo: StudentRepository(isar: isarService.isar)), 
          update: (_,repo,_)=>RollcallViewModel(repo: repo)
        ),
  ];
}

// ChangeNotifierProxyProvider<StudentRepository, RollcallViewModel>(
//   create: (_) => RollcallViewModel(),
//   update: (_, repo, vm) => vm!..updateRepo(repo),
// ),