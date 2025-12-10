import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'home_page.dart'; // Diperlukan untuk navigasi ke MainScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;
  late AnimationController _fadeTextController;
  late Animation<double> _fadeTextAnimation;

  bool _exitFade = false;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _slideAnimation = Tween<double>(begin: 0.0, end: -0.2).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );

    _fadeTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeTextAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeTextController);

    _startSequence();
  }

  void _startSequence() async {
    // Tahan 3 detik awal
    await Future.delayed(const Duration(seconds: 3));

    // Mulai animasi geser dan fade-in teks
    _slideController.forward();
    _fadeTextController.forward();

    // Tahan animasi selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    // Mulai fade-out seluruh layar
    setState(() {
      _exitFade = true;
    });

    // Tunggu fade-out selesai
    await Future.delayed(const Duration(milliseconds: 500));

    // Navigasi ke Home Page
    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainScreen(),
          transitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan AnimatedOpacity untuk fade-out seluruh layar
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: _exitFade ? 0.0 : 1.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animasi geser ke atas
              AnimatedBuilder(
                animation: _slideAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value * MediaQuery.of(context).size.height),
                    child: child,
                  );
                },
                child: Image.asset(
                  // Pastikan path ini benar
                  'assets/images/logo_only.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 0),
              // Animasi fade-in teks
              FadeTransition(
                opacity: _fadeTextAnimation,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome to ",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMaroon,
                              height: 1.0,
                            ),
                          ),
                          TextSpan(
                            text: "MY RSWN",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentOrange,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      "RSUD K.R.M.T WONGSONEGORO",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryPink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}