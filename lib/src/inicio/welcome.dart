

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_proyecto/src/login/login_page.dart';
import 'package:flutter_proyecto/src/register/register_controller.dart';
import 'package:flutter_proyecto/src/login/login_controller.dart';
import 'package:flutter_proyecto/src/utils/my_colors.dart';
import 'package:location/location.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
 // RegisterController _con = new RegisterController();
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  bool _isListenLocation= false,_isGetLocation=false;
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

      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            _buttonEmpezarT(),

            SingleChildScrollView(


              child: Column(

                children: [
                  SizedBox(height: 100, width: 300),
                  // Image.network("https://img.freepik.com/free-vector/blue-res-flasher-siren-vector-icon-set-isolated-white-background-alert-flashing-light-with-rays-flat-cartoon-style-siren-police-ambulance-light-illustration_502274-302.jpg?size=338&ext=jpg"),



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
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
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

  Widget _buttonEmpezarT(){
    return Column(
      //width: double.infinity,
      //margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed:() async {

           _serviceEnabled = await location.serviceEnabled();
           if(!_serviceEnabled){
             _serviceEnabled = await location.requestService();
             if(_serviceEnabled) return;
           }
           _permissionGranted = await location.hasPermission();
           if(_permissionGranted == PermissionStatus.denied){
             _permissionGranted = await location.requestPermission();
             if (_permissionGranted != PermissionStatus.granted) return;
           }
           setState(() {
             _isListenLocation=true;
           });

          },
          child: Text('EMPEZAR TURNO')),
          StreamBuilder(
              stream: location.onLocationChanged,
              builder: (content,snapshot){
                if(snapshot.connectionState != ConnectionState.waiting)
                {
                  var data = snapshot.data as LocationData;
                  return Text('Posición: \n ${data.latitude}/${data.longitude}');
                }else return Center(child: CircularProgressIndicator(),);
              }),

      ],

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
