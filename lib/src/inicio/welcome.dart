import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_proyecto/src/login/login_page.dart';
import 'package:flutter_proyecto/src/register/register_controller.dart';
import 'package:flutter_proyecto/src/login/login_controller.dart';
import 'package:flutter_proyecto/src/utils/my_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
 // RegisterController _con = new RegisterController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
     // _con.init(context);
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

            SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 50, width: 30),

                  _textRegister(),
                  Text('Su turno ya está activo'),
                  SizedBox(height: 50, width: 30),
                  _buttonFinalizarT()

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
    return Text('Bienvenido a Apoyo SOS Scz',
      style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _buttonFinalizarT(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),

      child: ElevatedButton(
        onPressed:(){},
        child: Text('FINALIZAR TURNO'),
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
