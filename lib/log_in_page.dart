import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 1. Pastikan import ini merujuk ke file yang benar
import 'appcolors.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const SizedBox(height: 30),
              // --- Header Logo ---
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_rswn.png',
                      width: 200,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.local_hospital,
                        size: 150,
                        color: AppColors.primaryMaroon,
                      ),
                    ),
                    const SizedBox(height: 13),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome to ",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentOrange,
                            ),
                          ),
                          TextSpan(
                            text: "MY RSWN",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMaroon,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "RSUD K.R.M.T WONGSONEGORO",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryMaroon,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Text(
                isSignInView ? "SIGN IN" : "SIGN UP",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentOrange,
                ),
              ),

              const SizedBox(height: 45),

              // --- FORM FIELDS ---
              if (!isSignInView) ...[
                _buildTextField(
                  label: "Full Name",
                  hint: "Enter your full name",
                ),
                const SizedBox(height: 20),
              ],
              _buildTextField(label: "Email", hint: "Enter your email"),
              const SizedBox(height: 20),
              _buildTextField(
                label: "Password",
                hint: isSignInView ? "Enter your password" : "Create password",
                isPassword: true,
              ),

              if (isSignInView)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryMaroon,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 35),

              // --- TOMBOL UTAMA ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // 2. GANTI DummyHomePage() menjadi HomePage()
                    // Pastikan nama class di file home_page.dart adalah 'HomePage'
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    isSignInView ? "Sign In" : "Sign Up",
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryMaroon,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              if (isSignInView) ...[
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.primaryMaroon.withOpacity(0.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: GoogleFonts.poppins(
                          color: AppColors.primaryMaroon,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.primaryMaroon.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    _buildSocialButton("Google", Icons.g_mobiledata),
                    const SizedBox(width: 15),
                    _buildSocialButton("Phone", Icons.phone_android),
                  ],
                ),
              ],

              const SizedBox(height: 40),

              // --- FOOTER SWITCHER ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSignInView
                        ? "Don’t have an account? "
                        : "Already have an account? ",
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryMaroon.withOpacity(0.7),
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignInView = !isSignInView;
                      });
                    },
                    child: Text(
                      isSignInView ? "Sign Up" : "Sign In",
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryMaroon,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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

  // --- HELPER WIDGETS ---
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
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.primaryMaroon.withOpacity(0.4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.accentOrange,
                width: 2,
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

  Widget _buildSocialButton(String label, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.accentOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primaryMaroon, size: 28),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: AppColors.primaryMaroon,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
