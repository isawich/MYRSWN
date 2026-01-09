import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20,
        right: 20,
        bottom: 120,
      ),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 25),
          _profileMainCard(),
        ],
      ),
    );
  }

  // ================= HEADER =================
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40, bottom: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFCC80),
            Color(0xFFE57373),
          ],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      child: Text(
        "My Profile",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryMaroon,
        ),
      ),
    );
  }

  // ================= MAIN PROFILE CARD =================
  Widget _profileMainCard() {
    return Transform.translate(
      offset: const Offset(0, -70),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppStyles.cardShadow,
          ),
          child: Column(
            children: [
              _avatar(),
              const SizedBox(height: 10),
              Text(
                "Sucipto Krispi",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primaryMaroon,
                ),
              ),
              const SizedBox(height: 4),
              _cmBadge(),
              const SizedBox(height: 16),

              // ===== MENU ITEMS (MASUK CARD BESAR) =====
              _menuItem(icon: Icons.edit, text: "Edit Profile"),
              _menuItem(icon: Icons.description, text: "Lab Tests & Reports"),
              _menuItem(icon: Icons.settings, text: "Settings"),
              _menuItem(icon: Icons.lock, text: "Change Password"),
              _menuItem(icon: Icons.help_outline, text: "Help & Feedback"),
              _menuItem(
                icon: Icons.logout,
                text: "Log out",
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= AVATAR =================
  Widget _avatar() {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryMaroon,
          width: 2,
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/sucipto_krispi.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ================= CM BADGE =================
  Widget _cmBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentOrange),
      ),
      child: Text(
        "No. CM 12345678910",
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: AppColors.accentOrange,
        ),
      ),
    );
  }

  // ================= MENU ITEM =================
  Widget _menuItem({
    required IconData icon,
    required String text,
    bool isLogout = false,
  }) {
    final color = isLogout ? Colors.red : AppColors.primaryMaroon;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: color),
        ],
      ),
    );
  }
}