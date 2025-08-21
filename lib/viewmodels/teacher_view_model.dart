import 'package:d_reg/data/models/teacher.dart';
import 'package:d_reg/data/repositories/teacher_repo.dart';
import 'package:d_reg/utils/password_encrypt.dart';
import 'package:flutter/material.dart';

class TeacherViewModel extends ChangeNotifier{

  late TeacherRepository _repo;

  // constructor with Dart initializer list, used for setting up fields before the constructor body executes.
  TeacherViewModel({required TeacherRepository repo}): _repo = repo;

  // hold error the viewmodel have
  // String? _error;

  // field specific errors
  String? _classNameError;
  String? _passwordError;
  String? _confirmPasswordError;

  // show when the viewmodel is waitting for data from repo
  bool _loading = false;

  // getter for error
  // String? get error => _error;

  // field specific getters
  String? get classNameError => _classNameError;
  String? get passwordError => _passwordError;
  String? get confirmPasswordError => _confirmPasswordError;

  // field specific setters
  void _setClassName(String? message){
    _classNameError = message;
    notifyListeners();
  }
  void _setPassword(String? message){
    _passwordError = message;
    notifyListeners();
  }
  void _setConfirmPassword(String? message){
    _confirmPasswordError = message;
    notifyListeners();
  }

  // getter for loading
  bool get loading => _loading;

  // setter for loading
  void _setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  // setter for loading
  // void _setError(String? message){
  //   _error = message;
  // }
  

  // ---- Field Validators ----
  bool validateClassName(String value) {

    if(value.isEmpty){
      _setClassName("Provide ClassName");
    }else{
      _setClassName(null);
      final trimmedValue = value.trim().toLowerCase();
      final valueRegex = RegExp(r'^[A-Za-z0-9\s]+$');

      if(!valueRegex.hasMatch(trimmedValue)){
         _setClassName("Provide Valid ClassName");
      }
    }
    // notifyListeners();
    return classNameError == null;
  }

  bool validatePassword(String value){

    if(value.isEmpty){
      _setPassword("Provide Password");
    }else{
      _setPassword(null);
      final trimmedValue = value.trim();

      if (trimmedValue.length < 8) {
        _setPassword('At least 8 characters');
      }
    }

    return passwordError == null;
  }

  bool validateConfirmPassword(String value){

    if(value.isEmpty){
      _setConfirmPassword("Provide Confirm Password");
    }else{
       _setConfirmPassword(null);
      final trimmedValue = value.trim();
      
      if (trimmedValue.length < 8) {
        _setConfirmPassword('At least 8 characters');
      }
      
      
    }
    return confirmPasswordError == null;
  }


  // compare password and confirm password
  bool _confirmPassword(confirmPassword,password){

    if(confirmPassword != password){
      _setConfirmPassword('Passwords must match');
      return false;
    }
    return true;
  }

  Future<bool> registerTeacher({
    required String className,
    required String password,
    required String confirmPassword
  }) async{

    bool validClassName = validateClassName(className);
    bool validPassword = validatePassword(password);
    bool validConfirmPassword = validateConfirmPassword(confirmPassword);

    if(validConfirmPassword){
      // compare password and confirm password
      validConfirmPassword = _confirmPassword(confirmPassword,password);
    }

    if(validClassName && validPassword && validConfirmPassword){
      _setLoading(true);

      try{
        
       
        final hashedPassword = PasswordEncrypt.hashedPassword(password: password);

        final teacher = Teacher(
          tId: _repo.generateTeacherId(),
          className: className.toLowerCase(),
          password: hashedPassword,
          createdAt: DateTime.now()
        );

        await _repo.registerTeacher(teacher);

        _setLoading(false);
        return true;

      }catch(e){

        return false;
      }

    }

    // _setLoading(true);

    return false;


  }


   Future<bool> loginTeacher({required String password}) async{

 
    bool validPassword = validatePassword(password);

   
    if(validPassword){

      try{

        _setLoading(true);

        final hashedPassword = await _repo.retrivePassword();

        final bool reHashedPassword = PasswordEncrypt.reHashedPassword(
          password: password, hashedPassword: hashedPassword);

        _setLoading(false);
       
       if(!reHashedPassword){
          _setPassword("Invalid Password");
       }


        return reHashedPassword;

      }catch(e){
        _setLoading(false);
        return false;
      }

    }

   

    return false;


  }
}