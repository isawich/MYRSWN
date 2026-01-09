import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart'; 

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = List.generate(
      7,
      (index) => {
        "title": "RSWN News",
        "date": "2 October 2025",
        "desc": "Lorem ipsum dolor sit amet, you're the best person i've ever met ......",
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // --- PERBAIKAN AGAR TIDAK BERUBAH WARNA SAAT SCROLL ---
        surfaceTintColor: Colors.white, 
        scrolledUnderElevation: 0, 
        // ------------------------------------------------------
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryMaroon),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Text(
          "Back",
          style: GoogleFonts.poppins(
            color: AppColors.primaryMaroon,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= TITLE SECTION =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notification",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentOrange,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: AppColors.primaryMaroon.withOpacity(0.5),
                ),
              ],
            ),
          ),
          
          // ================= LIST SECTION =================
          Expanded(
            child: ListView.builder(
              // PERBAIKAN: Padding atas 20 agar jarak ke garis pemisah konsisten
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _notificationCard(notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFC18C8C), 
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10), 
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['title']!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primaryMaroon,
                  ),
                ),
                Text(
                  data['date']!,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentOrange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              data['desc']!,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.primaryMaroon.withOpacity(0.8),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}