import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'log_in_page.dart';
import 'appcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;

  late AnimationController _fadeTextController;
  late Animation<double> _fadeTextAnimation;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool _exitFade = false;

  @override
  void initState() {
    super.initState();

    /// ✅ PRECACHE LOGO LOGIN (INI YANG PENTING)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/images/logo_rswn.png'), context);

      // optional (kalau mau sekalian)
      precacheImage(const AssetImage('assets/images/logo_only.png'), context);
    });

    // ======================
    // ANIMATIONS (TETAP SAMA)
    // ======================

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: -0.035,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeTextAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeTextController);

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );

    _scaleController.forward();

    _startSequence();
  }

  void _startSequence() async {
    await Future.delayed(const Duration(seconds: 2));

    _slideController.forward();
    _fadeTextController.forward();

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _exitFade = true;
      });
    }

    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeTextController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: _exitFade ? 0.0 : 1.0,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFF4F0), Colors.white],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO
                AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        0,
                        _slideAnimation.value *
                            MediaQuery.of(context).size.height,
                      ),
                      child: child,
                    );
                  },
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: const Image(
                      image: AssetImage('assets/images/logo_only.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // TEXT
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
                              ),
                            ),
                            TextSpan(
                              text: "MY RSWN",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accentOrange,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "RSUD K.R.M.T WONGSONEGORO",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryMaroon,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Your Health Companion",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.primaryMaroon,
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            minHeight: 4,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation(
                              AppColors.accentOrange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
