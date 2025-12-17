import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

// --- MAIN SCREEN (Scaffold Wrapper) ---
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Index 0 = Home (default)
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // Konten halaman utama
      body: const HomePageContent(),
      // Bottom Nav Bar kustom
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// --- HOME PAGE CONTENT (Isi Halaman) ---
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SingleChildScrollView(
      // Padding bawah lebih besar untuk mengakomodir BottomNav yang besar dan melengkung
      padding: EdgeInsets.only(top: topPadding + 10, bottom: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. HEADER (RSWN Logo & Notification Bell)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_rswn.png', // Pastikan path ini benar
                  height: 30,
                  fit: BoxFit.contain,
                ),

                const Icon(Icons.notifications_outlined, color: AppColors.primaryMaroon, size: 28),
              ],
            ),
            const SizedBox(height: 18),

            // 2. GREETING (Hello, Sucipto Krispi)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hello, ",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentOrange
                    ),
                  ),
                  TextSpan(
                    // PERBAIKAN: Menggunakan nama dari gambar
                    text: "Sucipto Krispi",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryMaroon
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            Text(
              "How can we help today?",
              style: GoogleFonts.poppins(fontSize: 15, color: AppColors.secondaryPink, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 18),

            // 3. SEARCH BAR
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: AppStyles.cardShadow,
                // PERBAIKAN FOKUS: Menyesuaikan border dengan warna Doctor's Schedule
                // Menggunakan secondaryPink dengan opasitas agar tipis dan sesuai gambar
                border: Border.all(color: AppColors.secondaryPink.withOpacity(0.8), width: 1.5),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search",
                  // PERBAIKAN FOKUS: Warna hint disesuaikan menjadi warna gelap/pink
                  hintStyle: GoogleFonts.poppins(color: AppColors.secondaryPink),
                  // PERBAIKAN FOKUS: Warna ikon prefix disesuaikan menjadi warna gelap/pink
                  prefixIcon: Icon(Icons.search, color: AppColors.secondaryPink),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 4. MENU GRID (Online Reg, Schedule, Ambulance, Other)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // PERBAIKAN: Menaikkan aspect ratio agar lebih lebar dan lebih pendek (2.4 vs 2.2)
              childAspectRatio: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _buildMenuItem(Icons.format_list_bulleted, "Online\nRegistration", AppColors.menuOrangeBg, AppColors.accentOrange), // Icon disesuaikan
                _buildMenuItem(Icons.person, "Doctor's\nSchedule", AppColors.menuPinkBg, AppColors.primaryMaroon),
                _buildMenuItem(Icons.phone_in_talk, "Call an\nAmbulance", AppColors.menuRedBg, Colors.redAccent), // Icon disesuaikan
                _buildMenuItem(Icons.grid_view_rounded, "Other\nMenus", AppColors.menuGreenBg, Colors.green),
              ],
            ),
            const SizedBox(height: 10),

            // 5. UPCOMING APPOINTMENTS HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming Appointments",
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryMaroon)),
                _buildSeeMoreLink(), // Menggunakan fungsi yang sama untuk konsistensi
              ],
            ),
            const SizedBox(height: 12),
            // APPOINTMENT CARD
            _buildAppointmentCard(),
            const SizedBox(height: 12),

            // 6. RSWN NEWS HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("RSWN News", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryMaroon)),
                _buildSeeMoreLink(),
              ],
            ),
            const SizedBox(height: 15),

            // 7. NEWS GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // Dipertahankan agar tampilan card berita proporsional
                childAspectRatio: 0.85,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                // Asumsi path gambar berita
                String imgPath = (index % 2 == 0) ? 'assets/images/berita1.jpg' : 'assets/images/berita2.jpg';
                return _buildNewsCard(imgPath, index);
              },
            ),
            const SizedBox(height: 14),

            // 8. FAQ HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FAQ", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryMaroon)),
              ],
            ),
            const SizedBox(height: 12),

            // 9. FAQ ITEMS
            _buildFaqItem("Kapan jam layanan RSD K.R.M.T Wongsonegoro?"),
            _buildFaqItem("Kapan jam besuk di RSD K.R.M.T Wongsonegoro?"),
            _buildFaqItem("Dimana saya bisa melihat jadwal dokter?"),
            _buildFaqItem("Dimana saya dapat menyampaikan pengaduan?"),

            const SizedBox(height: 24),

            // 10. CONTACT BOTTOM
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    decoration: BoxDecoration(
                      // Warna Latar Belakang disesuaikan (menuOrangeBg)
                      color: AppColors.menuOrangeBg,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: AppStyles.cardShadow,
                    ),
                    child: Text("Any Question?", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppColors.primaryMaroon, fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentOrange,
                    foregroundColor: AppColors.primaryMaroon,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text("Contact Us", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildSeeMoreLink() {
    return Text(
      "See More",
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        color: AppColors.primaryMaroon,
        // Dihilangkan jika tidak ingin ada underline
        // decoration: TextDecoration.underline,
        // decorationColor: AppColors.primaryMaroon,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, Color bg, Color iconColor) {
    return Container(
      // PERBAIKAN: Menambahkan border tipis seperti di gambar
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // PERBAIKAN FOKUS: Border disesuaikan dengan warna ikon (iconColor)
        border: Border.all(color: iconColor.withOpacity(0.5), width: 1.5),
        boxShadow: AppStyles.cardShadow,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              // PERBAIKAN FOKUS: Font diperbesar dan warna teks disesuaikan dengan iconColor
              style: GoogleFonts.poppins(
                  fontSize: 14.5, // Ukuran font diperbesar
                  fontWeight: FontWeight.w700,
                  color: iconColor, // Warna teks mengikuti warna ikon
                  height: 1.2
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentOrange,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppStyles.cardShadow,
      ),
      // Padding luar dikurangi menjadi 15 agar konten di dalamnya lebih lebar
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Date Container (kotak tanggal)
          Container(
            // PERBAIKAN FOKUS: Lebar kotak tanggal ditingkatkan dari 90 menjadi 100
            width: 100,
            height: 115,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text MON
                Text("MON", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppColors.primaryMaroon, fontSize: 20)),
                // Text 27
                Text("27", style: GoogleFonts.poppins(fontSize: 38, fontWeight: FontWeight.bold, color: AppColors.primaryMaroon, height: 1)),
              ],
            ),
          ),
          // Spasi antara kotak tanggal dan detail
          const SizedBox(width: 10),
          // Details Container (mengambil sisa ruang, yang sekarang lebih kecil karena kotak tanggal membesar)
          Expanded(
            child: Container(
              // Padding dikurangi sedikit karena ruang horizontalnya berkurang
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Fisiotherapy
                  Text("Fisiotherapy", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryMaroon)),
                  const SizedBox(height: 2),
                  // Doctor Name
                  Text("dr. Yanto Kopling, S.KFR", style: GoogleFonts.poppins(fontSize: 12.5, color: AppColors.accentOrange, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 14, color: AppColors.primaryMaroon),
                      const SizedBox(width: 6),
                      // Font size dikecilkan agar teks lokasi/waktu bisa muat
                      Expanded(child: Text("Klinik Rehabillitas Medik, RSWN", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 11, color: AppColors.primaryMaroon), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Time
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: AppColors.primaryMaroon),
                      const SizedBox(width: 6),
                      Text("09.30 - 10.30 WIB", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 11, color: AppColors.primaryMaroon)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String imagePath, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppStyles.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
                imagePath, // Pastikan path ini benar
                height: 50,
                width: double.infinity,
                fit: BoxFit.cover
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: AppColors.accentOrange, borderRadius: BorderRadius.circular(5)),
                  child: Text(index % 2 == 0 ? "15 June 2024" : "27 Dec 2022", style: GoogleFonts.poppins(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 8),
                Text(
                  "RSUD KRMT Wongsonegoro Semarang Bakal Miliki Gedung Pelayanan Kanker Terpadu",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.primaryMaroon, height: 1.3),
                ),
                const SizedBox(height: 10),
                Text("Read Now", style: GoogleFonts.poppins(fontSize: 11, color: AppColors.secondaryPink, fontWeight: FontWeight.w600, decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // PERBAIKAN: Border tipis orange/pink
        border: Border.all(color: AppColors.accentOrange.withOpacity(0.7), width: 1),
        boxShadow: AppStyles.cardShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Theme(
          // Menghilangkan divider bawaan ExpansionTile
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            // PERBAIKAN: Mengatur vertical padding agar lebih rapat
            tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            iconColor: AppColors.primaryMaroon,
            collapsedIconColor: AppColors.primaryMaroon,
            title: Text(question, style: GoogleFonts.poppins(fontSize: 12.5, color: AppColors.primaryMaroon, fontWeight: FontWeight.w600)),
            children: [
              Text(
                "Informasi detail mengenai ${question.toLowerCase()} dapat dilihat di website resmi atau menghubungi call center.",
                style: GoogleFonts.poppins(fontSize: 11.5, color: AppColors.textDark),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// --- CUSTOM BOTTOM NAV BAR ---
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // Background Shape Maroon
        ClipPath(
          // PERBAIKAN: Menggunakan BottomNavCurveClipper
          clipper: BottomNavCurveClipper(),
          child: Container(
            height: 90,
            color: AppColors.primaryMaroon,
          ),
        ),
        // Icons Row
        SizedBox(
          height: 90,
          child: Padding(
            // PERBAIKAN: Padding atas lebih banyak untuk menempatkan ikon non-aktif
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start, // Align ke atas
              children: [
                _buildNavItem(Icons.home_filled, "Home", 0),
                _buildNavItem(Icons.confirmation_number_outlined, "Queue", 1),
                _buildNavItem(Icons.calendar_today_outlined, "Appointments", 2),
                _buildNavItem(Icons.person_outline, "Profile", 3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = currentIndex == index;

    final iconColor = isSelected ? AppColors.primaryMaroon : AppColors.accentOrange;

    Widget labelWidget = Text(label, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.accentOrange));

    Widget content;

    if (isSelected) {
      // Tombol Aktif (Lingkaran Orange dengan Ikon Maroon)
      content = Transform.translate(
        // PERBAIKAN: Geser ke atas lebih banyak
        offset: const Offset(0, -30),
        child: Container(
          width: 60, // PERBAIKAN: Ukuran lingkaran lebih besar
          height: 60, // PERBAIKAN: Ukuran lingkaran lebih besar
          decoration: BoxDecoration(
              color: AppColors.accentOrange,
              // PERBAIKAN: Menggunakan bentuk lingkaran penuh
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 4))
              ]
          ),
          child: Icon(icon, color: AppColors.primaryMaroon, size: 28),
        ),
      );
    } else {
      // Tombol Tidak Aktif (Ikon Orange dengan Teks di bawah)
      content = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 2),
          // Teks di bawah ikon non-aktif berwarna orange
          Text(label, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.accentOrange)),
        ],
      );
    }

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        height: 90,
        child: Center(
          child: content,
        ),
      ),
    );
  }
}

// Clipper untuk bentuk melengkung navbar yang disesuaikan
class BottomNavCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Titik awal
    path.moveTo(0, 20);

    // Bagian melengkung di kiri
    path.lineTo(size.width * 0.35, 20);
    path.quadraticBezierTo(size.width * 0.40, 20, size.width * 0.40, 0); // Kurva pertama ke titik atas tengah

    // Titik paling atas di tengah (di atas tombol home)
    path.cubicTo(
      size.width * 0.40, -10, // Kontrol 1 (naik)
      size.width * 0.60, -10, // Kontrol 2 (naik)
      size.width * 0.60, 0,   // Titik tertinggi di tengah
    );

    // Bagian melengkung di kanan
    path.quadraticBezierTo(size.width * 0.60, 20, size.width * 0.65, 20); // Kurva kedua kembali ke garis lurus

    // Garis lurus ke kanan
    path.lineTo(size.width, 20);

    // Bagian bawah
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}