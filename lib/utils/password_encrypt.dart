import 'package:bcrypt/bcrypt.dart';

class PasswordEncrypt {

  


  static String hashedPassword({required String password}){

    final String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

    return hashed;
  }
  
  static bool reHashedPassword({
    required String password, 
    required String hashedPassword
  }){

    final bool checkPassword = BCrypt.checkpw(password, hashedPassword);

    return checkPassword;
  }
}