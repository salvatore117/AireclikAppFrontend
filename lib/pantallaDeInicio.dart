import 'package:aireclikapp/material/bottomwii.dart';
import 'package:flutter/material.dart';


class PantallaDeInicio extends StatelessWidget {
  const PantallaDeInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                            Image.asset(  
                'assets/logo.png',
                width: 200,  
                height: 200,  
              ),
          SizedBox(height: 15,),
              WiiButton(
            onPressed: () => print("¡Botón presionado!"),
            child: const Text(
              " INICIAR SESION",
              style: TextStyle(
          fontSize: 30, 
          fontWeight: FontWeight.bold, 
          color: Color.fromARGB(255, 27, 209, 255),
          letterSpacing: 1,
              ),
            ),
          ),  
          SizedBox(height: 15,),
                      WiiButton(
            onPressed: () => print("¡Botón presionado!"),
            child: const Text(
              " REGISTRARSE",
              style: TextStyle(
          fontSize: 30, 
          fontWeight: FontWeight.bold, 
          color: Color.fromARGB(255, 27, 209, 255),
          letterSpacing: 1,
              ),
            ),
          ),
            ],
          ),
        ],
      )
    );
  }
}