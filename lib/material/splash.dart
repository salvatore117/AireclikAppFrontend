import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: SnowTransitionPage()));

class SnowTransitionPage extends StatefulWidget {
  const SnowTransitionPage({super.key});

  @override
  State<SnowTransitionPage> createState() => _SnowTransitionPageState();
}

class _SnowTransitionPageState extends State<SnowTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Snowflake> snowflakes = [];
  bool isSnowing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Duración de la transición
    )..addListener(() {
        if (isSnowing) _updateSnow();
      });
  }

  // Crea los copos iniciales
  void _startSnowfall() {
    final size = MediaQuery.of(context).size;
    setState(() {
      isSnowing = true;
      snowflakes = List.generate(100*10, (index) => Snowflake(size.width, size.height));
    });
    _controller.forward(from: 0).then((_) {
      // Aquí podrías navegar a otra pantalla cuando termine
    });
  }

  void _updateSnow() {
    setState(() {
      for (var flake in snowflakes) {
        flake.fall();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // Fondo oscuro para que resalte la nieve
      body: Stack(
        children: [
          const Center(
            child: Text("Contenido de la App", 
              style: TextStyle(color:   Colors.white, fontSize: 24)),
          ),
          // Capa de nieve
          if (isSnowing)
            CustomPaint(
              size: Size.infinite,
              painter: SnowPainter(snowflakes: snowflakes, fillProgress: _controller.value),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startSnowfall,
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}

// Modelo de cada copo de nieve
class Snowflake {
  double x;
  double y;
  double radius;
  double velocity;
  final double maxWidth;
  final double maxHeight;

  Snowflake(this.maxWidth, this.maxHeight)
      : x = Random().nextDouble() * maxWidth,
        y = -Random().nextDouble() * maxHeight, // Empiezan fuera de pantalla arriba
        radius = Random().nextDouble() * 3 + 2,
        velocity = Random().nextDouble() * 4 + 2;

  void fall() {
    y += velocity;
    // Un poco de movimiento horizontal tipo zigzag
    x += sin(y / 20) * 0.5;
  }
}

// Dibujante de la nieve
class SnowPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final double fillProgress;

  SnowPainter({required this.snowflakes, required this.fillProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.cyan;

    // Dibujar cada copo
    for (var flake in snowflakes) {
      canvas.drawCircle(Offset(flake.x, flake.y), flake.radius, paint);
    }

    // Efecto de "llenado" o acumulación en el fondo
    // A medida que progresa la animación, dibujamos un rectángulo blanco que sube
    if (fillProgress > 0.5) {
      double fillHeight = size.height * (fillProgress - 0.5) * 2;
      canvas.drawRect(
        Rect.fromLTWH(0, size.height - fillHeight, size.width, fillHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}