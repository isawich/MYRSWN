import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllServicesPage extends StatelessWidget {
  const AllServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menghitung aspect ratio berdasarkan W:109 dan H:118
    const double cardWidth = 109;
    const double cardHeight = 118;
    const double customAspectRatio = cardWidth / cardHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // TOMBOL BACK
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF801E1D),
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Back",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF801E1D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "All Services",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFF3A43B),
                ),
              ),
              const SizedBox(height: 25),

              // --- SECTION 1 ---
              _buildSectionTitle("Patient Information"),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: customAspectRatio,
                children: [
                  _buildServiceCard(
                    Icons.format_list_bulleted_rounded,
                    "Online\nRegistration",
                    const Color(0xFFF3A43B),
                  ),
                  _buildServiceCard(
                    Icons.person,
                    "Doctor's\nSchedule",
                    const Color(0xFF801E1D),
                  ),
                  _buildServiceCard(
                    Icons.phone_in_talk,
                    "Call an\nAmbulance",
                    const Color(0xFFD32F2F),
                  ),
                  _buildServiceCard(
                    Icons.confirmation_number_outlined,
                    "Hospital\nQueue",
                    const Color(0xFF007BFF),
                  ),
                  _buildServiceCard(
                    Icons.hotel_rounded,
                    "Inpatient\nRoom",
                    const Color(0xFFC0A205),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // --- SECTION 2 ---
              _buildSectionTitle("Public Information"),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: customAspectRatio,
                children: [
                  _buildServiceCard(
                    Icons.menu_book_rounded,
                    "Registration\nGuide",
                    const Color(0xFF6A1B9A),
                  ),
                  _buildServiceCard(
                    Icons.favorite_rounded,
                    "Facilities &\nServices",
                    const Color(0xFFC2185B),
                  ),
                  _buildServiceCard(
                    Icons.apartment_rounded,
                    "RSWN\nProfile",
                    const Color(0xFF8D6E63),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF801E1D),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 1.2,
          width: double.infinity,
          color: const Color(0xFFF3A43B),
        ),
      ],
    );
  }

  Widget _buildServiceCard(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(
        4,
      ), // Padding diperkecil agar font besar muat
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          // PERBAIKAN: Jarak teks dengan box icon menjadi 10
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              // PERBAIKAN: Font size menjadi 13 dan Bold
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
