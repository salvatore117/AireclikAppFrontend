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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(  
                'assets/logo.png',
                width: 200,  
                height: 200,  
              ),
SizedBox(height: 20),
Text("AMBIENTA TU VIDA, REFRESCA TU MUNDO", style: TextStyle(fontSize:10, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 27, 209, 255), letterSpacing: 1),),
Text("SOMOS AIRECLIK LA FAMILIA QUE MANTIENE ", style: TextStyle(fontSize:10, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 27, 209, 255), letterSpacing: 1),textAlign: TextAlign.justify,),
Text("TU EQUIPO EN LAS CONDICIONES QUE USTED SE MERECE ", style: TextStyle(fontSize:10, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 27, 209, 255), letterSpacing: 1),textAlign: TextAlign.justify,),
SizedBox(height: 20),
              WiiButton(
            onPressed: () => {/*INTEGRAR LA SESION DE LA APP*/},
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
          SizedBox(height: 20), // Espacio entre los botones
                      WiiButton(
            onPressed: () => {/*INTEGRAR EL LOGIN DE LA APP*/},
            child: const Text(
              " REGIISTRARSE",
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