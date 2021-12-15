import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_proyecto/src/inicio/welcome.dart';
import 'package:flutter_proyecto/src/login/login_page.dart';
import 'package:flutter_proyecto/src/register/register_controller.dart';
import 'package:flutter_proyecto/src/login/login_controller.dart';
import 'package:flutter_proyecto/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = new RegisterController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Turno'),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            /*   Positioned(
              top: -80,
              left: -100,
              child: _circle(),
            ),
            Positioned(
                child: _textRegister(),
                top: 66,
                left: 25,
            ),
           Positioned(
              child: _iconBack(),
              top: 53,
              left: -6,
            ),*/
            SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 100, width: 300),
                  Text('Registre su turno para empezar'),
                  SizedBox(height: 50, width: 300),
                 // _textFieldEmail(),
                  _textFieldName(), //Fecha
                  _textFieldLastName(), //Hora
                  _textFieldPhone(),  //Unidad
                  //_textFieldPassword(),
                  //_textFieldConfirmePassword(),
                  _buttonLogin()

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
 /* Widget _iconBack(){
    return IconButton(
       onPressed: () {
      Navigator.pop(context);
    },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white)
    );
  }*/
  Widget _textRegister(){
    return Text('REGISTRO',
    style: TextStyle(
        color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      fontFamily: 'NimbusSans'
    ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),

      child: ElevatedButton(
        onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomePage()),
          );
        },
        child: Text('REGISTRAR TURNO'),
        style: ElevatedButton.styleFrom(
          primary: MyColors.colorsBottom,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
          padding: EdgeInsets.symmetric(vertical: 15),

        ),
      ),
    );
  }
  Widget _textFieldLastName(){  //Hora
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50, vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.lastnameController,
        decoration: InputDecoration(
            hintText: 'Hora',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Colors.black38,

            ),
            prefixIcon: Icon(
              Icons.access_time_rounded,
              color: Colors.blue[300],
            )
        ),
      ),
    );
  }
  Widget _textFieldPhone(){ //Unidad
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50, vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Unidad',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Colors.black38,

            ),
            prefixIcon: Icon(
              Icons.lightbulb_rounded,
              color: Colors.blue[300],
            )
        ),
      ),
    );
  }
  Widget _textFieldConfirmePassword(){
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50, vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.confirmpasswordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña ',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Colors.black38,

            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.blue[300],
            )
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50, vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Colors.black38,

            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.blue[300],
            )
        ),
      ),
    );
  }
  Widget _textFieldName(){
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50, vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
            hintText: 'Fecha',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Colors.black38,

            ),
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Colors.blue[300],
            )
        ),
      ),
    );
  }

  /*Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 50, vertical: 5
      ),
      decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Colors.black38,
              
            ),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blue[300],
            )
        ),
      ),
    );
  }*/

  Widget _circle(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue
      ),
    );
  }
}
