import 'package:flutter/material.dart';

class RegisterController{
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();

  Future init(BuildContext context){
    this.context = context;
  }
  void goToLogin(){
    Navigator.pushNamed(context, 'login');
  }
  void register(){
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmpasswordController.text.trim();



    print(email);
    print(name);
    print(lastname);
    print(phone);
    print(password);
    print(confirmpassword);


  }

}