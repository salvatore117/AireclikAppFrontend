import 'package:flutter/material.dart';

class WiiButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const WiiButton({super.key, required this.child, required this.onPressed});

  @override
  State<WiiButton> createState() => _WiiButtonState();
}

class _WiiButtonState extends State<WiiButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50), // Rápido, como un clic real
    );

    // El botón se encoge un 5% al presionarlo
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(), // Se hunde
      onTapUp: (_) {
        _controller.reverse(); // Vuelve a su sitio
        widget.onPressed();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                // El borde gris clásico de la Wii
                border: Border.all(color: Colors.grey.shade300, width: 2),
                boxShadow: [
                  
                  // Sombra de profundidad que desaparece cuando se presiona
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: _controller.value * 2,
                    offset: Offset(0, 4 - (4 * _controller.value)),
                  ),
                  // El "Glow" azul sutil característico
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.50 * _controller.value),
                    blurRadius: 15,
                    spreadRadius: 5 * _controller.value,
                  ),
                ],
              ),
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}