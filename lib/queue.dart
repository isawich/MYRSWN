import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'main.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: topPadding + 12,
        left: 24,
        right: 24,
        bottom: 120,
      ),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 18),

          // 🔥 BLOK CARD DENGAN GRADIENT
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE57373), // merah
                  Color(0xFFFFCC80), // kuning
                ],
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: AppStyles.cardShadow,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _queueCardInner(),
                const SizedBox(height: 16),
                _doctorFooterInner(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // ================= HEADER =================
  Widget _header() {
    return Text(
      "Hospital Queue",
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.accentOrange,
      ),
    );
  }

  // ================= QUEUE CARD =================
  Widget _queueCardInner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.primaryMaroon,
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Appointment Detail"),
          const SizedBox(height: 6),
          const Divider(color: Color(0xFF8C1D18), thickness: 1),

          _row("Nama", "Sucipto Krispi"),
          _row("No. RM", "123456"),
          _row("Birth Date", "25 September 1995"),
          _row("Address", "Perumahan XXXXX, Jl. Kesana Kemari"),

          const SizedBox(height: 10),
          const Divider(color: Color(0xFFF9A825), thickness: 1),
          const SizedBox(height: 6),

          _row("Queue", "12"),
          _row("Date", "Thursday, 6 October 2025"),
          _row("Time", "12.30 – 14.00 WIB"),
          _row("Poli", "Klinik Gigi Konservasi"),
          _row("Doctor", "dr. Sugeng Saklar, S.KG"),
        ],
      ),
    );
  }

  // ================= DOCTOR FOOTER =================
  Widget _doctorFooterInner() {
    return Row(
      children: [
        _qrCode(),
        const SizedBox(width: 14),
        Expanded(
          child: Container(
            height: 82,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "dr. Sugeng Saklar, S.KG",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryMaroon,
              ),
            ),
          ),
        ),
      ],
    );
  }


  // ================= HELPERS =================
  Widget _sectionTitle(String title) {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryMaroon,
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 95,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryMaroon,
              ),
            ),
          ),
          const Text(": "),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                color: AppColors.primaryMaroon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= QR =================
  Widget _qrCode() {
    return Container(
      width: 82,
      height: 82,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9A825), // kotak kuning
        borderRadius: BorderRadius.circular(18),
      ),
      child: QrImageView(
        data: "RSWN-QUEUE-12",
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Colors.white,
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Colors.white,
        ),
      ),
    );
  }
}