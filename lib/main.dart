import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart'; // Pastikan Anda memiliki file ini
import 'home_page.dart';    // Pastikan Anda memiliki file ini

void main() {
  runApp(const MyApp());
}

// --- GLOBAL COLORS & STYLES ---
class AppColors {
  // Warna Utama dari gambar: Maroon, Pink (Muda/Sekunder), Orange (Aksen)
  static const Color primaryMaroon = Color(0xFF822C2E); // #822C2E
  static const Color secondaryPink = Color(0xFFC08D8D); // #C08D8D
  static const Color accentOrange = Color(0xFFF09A31); // #F09A31 (Warna utama di appointment/icon aktif)
  static const Color textDark = Color(0xFF333333);
  static const Color backgroundGrey = Color(0xFFF9F9F9);

  // Warna latar belakang menu dari gambar
  static const Color menuOrangeBg = Color(0xFFFFEBD2); // Warna Latar Belakang menu (Online Registration / Any Question)
  static const Color menuPinkBg = Color(0xFFF5E1E1);   // Warna Latar Belakang menu (Doctor's Schedule)
  static const Color menuRedBg = Color(0xFFFFDADA);    // Warna Latar Belakang menu (Call an Ambulance)
  static const Color menuGreenBg = Color(0xFFDFF3D8);  // Warna Latar Belakang menu (Other Menus)
}

// Definisi Shadow standar agar seragam
class AppStyles {
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: 10,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RSWN App',
      theme: ThemeData(
        primaryColor: AppColors.primaryMaroon,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      builder: (context, child) {
        // Pembatasan lebar maksimum untuk tampilan di layar besar
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 430),
            child: child,
          ),
        );
      },
      // Mengarahkan ke SplashScreen terlebih dahulu
      home: const SplashScreen(),
    );
  }
}