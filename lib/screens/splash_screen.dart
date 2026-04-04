import 'package:flutter/material.dart';
import '../constants.dart';
import '../services/audio_service.dart';
import 'menu_screen.dart';

class SplashScreen extends StatefulWidget {
  final AudioService audioService;

  const SplashScreen({super.key, required this.audioService});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: kFadeDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Hold full color for 2s, then fade to gray in the last 1s
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      _fadeController.forward();
    });

    // Navigate after the fade completes
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MainMenuScreen(audioService: widget.audioService),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: kFadeDuration,
        ),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/elara_menu.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Container(
                  color: Colors.white.withValues(alpha: _fadeAnimation.value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
