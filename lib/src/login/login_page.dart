
import 'package:flutter_proyecto/src/register/register_page.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/src/utils/my_colors.dart';
import 'package:flutter_proyecto/src/login/login_controller.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('INIT STATE');

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: _textLogin(),
              top:305,
              left: 150,

            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _lottieAnimation(),
                  //_imageBanner(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                 // _textDontHaveAccount(),
                ],
              ),
            ),
        ],
        ),
      )
    );
  }

  Widget _lottieAnimation(){
    return Container(
      margin: EdgeInsets.only(
        top:100,
        bottom: MediaQuery.of(context).size.height * 0.10
      ),
      child: Lottie.asset('assets/json/7764-sos-animation.json',
        //width: 350,
        height: 200,
        fit: BoxFit.fill
      ),
    );
  }

  Widget _textLogin(){
    return Text('U.A.G.R.M',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'NimbusSans'
      ),
    );
  }
  /*Widget _textDontHaveAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿No tienes cuenta?'),
        SizedBox(width: 10),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            ),
          ),
        ),
      ],
    );
  }*/


  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),

      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
          child: Text('INGRESAR'),
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

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
            )

        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50
      ),

      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey,
          )
        ),
      ),
    );
  }

  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(
        top: 100,
        bottom: MediaQuery.of(context).size.height * 0.10,

      ),
      child: Image.asset(
        'assets/img/21-avatar-outline.png',
        width: 200,
        height: 200,
      ),
    );
  }

}
