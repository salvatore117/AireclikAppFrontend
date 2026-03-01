import 'dart:math' as math;

import 'package:flutter/material.dart';

class DecoracionFondo extends StatelessWidget {
  final Widget child; // Aquí pasaremos todo tu contenido principal

  const DecoracionFondo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Círculo decorativo superior derecho
        Positioned(
          top: -80,
          right: -80,
          child: _circulo(240, Color.fromARGB(169, 27, 209, 255)),
        ),

        // Círculo decorativo inferior izquierdo
        Positioned(
          bottom: -50,
          left: -50,
          child: _circulo(200, Color.fromARGB(169, 27, 209, 255)),
        ),

        // Icono decorativo rotado en la parte superior izquierda
        Positioned(
          top: 60,
          left: -30,
          child: _iconosFondo(
            icon: Icons.ac_unit,
            size: 100,
            angleDegrees: 45, // Rotación amigable en grados
            color: Color.fromARGB(255, 27, 209, 255),
          ),
        ),

        // Icono decorativo rotado en la parte inferior derecha
        Positioned(
          top: 75 * 8,
          left: 70 * 3,
          child: _iconosFondo(
            icon: Icons.ac_unit,
            size: 100 * 2,
            angleDegrees: 45, // Rotación amigable en grados
            color: Color.fromARGB(255, 27, 209, 255),
          ),
        ),

        // El contenido principal que pasamos por parámetro
        SafeArea(child: child),
      ],
    );
  }

  // Un pequeño helper para no repetir código de círculos
  Widget _circulo(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

Widget _iconosFondo({
  required IconData icon,
  required double size,
  required double angleDegrees,
  required Color color,
}) {
  // Convertimos grados a radianes: radianes = grados * (pi / 180)
  final radians = angleDegrees * (math.pi / 180);

  return Transform.rotate(
    angle: radians, // Aquí aplicamos la rotación
    child: Icon(icon, size: size, color: color),
  );
}
