import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Switcher untuk ganti tampilan antara Sign In dan Sign Up
  bool isSignInView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // --- Bagian Header Logo (Gambar 3) ---
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_rswn.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 4),
                    Text(
                      "RSUD K.R.M.T WONGSONEGORO",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryPink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Judul Halaman (SIGN IN / SIGN UP)
              Text(
                isSignInView ? "SIGN IN" : "SIGN UP",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentOrange,
                ),
              ),
              const SizedBox(height: 30),

              // --- FORM FIELDS ---
              if (!isSignInView) ...[
                _buildTextField(
                  label: "Full Name",
                  hint: "Enter your full name",
                ),
                const SizedBox(height: 15),
              ],
              _buildTextField(label: "Email", hint: "Enter your email"),
              const SizedBox(height: 15),
              _buildTextField(
                label: "Password",
                hint: isSignInView ? "Enter your password" : "Create password",
                isPassword: true,
              ),

              if (!isSignInView) ...[
                const SizedBox(height: 15),
                _buildTextField(
                  label: "Confirm Password",
                  hint: "Confirm your password",
                  isPassword: true,
                ),
              ],

              if (isSignInView)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryMaroon,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // --- TOMBOL UTAMA ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke Home Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentOrange,
                    shape: RoundedRectanglePlatform.isAndroid
                        ? RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                        : StadiumBorder(),
                    elevation: 0,
                  ),
                  child: Text(
                    isSignInView ? "Sign In" : "Sign Up",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // --- PEMBATAS / OR CONTINUE WITH (Hanya di Sign In) ---
              if (isSignInView) ...[
                Row(
                  children: [
                    const Expanded(
                      child: Divider(thickness: 1, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: GoogleFonts.poppins(
                          color: AppColors.secondaryPink,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(thickness: 1, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildSocialButton(
                      "Google",
                      Icons.g_mobiledata,
                      const Color(0xFFF09A31),
                    ),
                    const SizedBox(width: 15),
                    _buildSocialButton(
                      "Phone Number",
                      Icons.phone_android,
                      const Color(0xFFF09A31),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 30),

              // --- SWITCHER FOOTER ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSignInView
                        ? "Don't have an account? "
                        : "Already have an account? ",
                    style: GoogleFonts.poppins(
                      color: AppColors.secondaryPink,
                      fontSize: 13,
                    ),
                  ),
                  GestureDetector(
                    onPressed: () {
                      setState(() {
                        isSignInView = !isSignInView;
                      });
                    },
                    child: Text(
                      isSignInView ? "Sign Up" : "Sign In",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryMaroon,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryMaroon,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.shade400,
              fontSize: 13,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.accentOrange,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.primaryMaroon,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryMaroon, size: 24),
            const SizedBox(width: 5),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: AppColors.primaryMaroon,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
