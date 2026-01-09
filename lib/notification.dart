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
        "desc":
            "Lorem ipsum dolor sit amet, you're the best person i've ever met ......",
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        // 2. Tombol back: Arrow back ukuran 24
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryMaroon,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        // 2. Tombol back: Font ukuran 18, Bold
        title: Text(
          "Back",
          style: GoogleFonts.poppins(
            color: AppColors.primaryMaroon,
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
                // 1. Notification: Ukuran 35, Semi-Bold
                Text(
                  "Notification",
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600, // Semi-Bold
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Center(child: _notificationCard(notifications[index]));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationCard(Map<String, String> data) {
    return Container(
      // 7. Card Luar (Ungu/Brown): Ukuran 348 x 112
      width: 348,
      height: 112,
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
      // Alignment center agar card putih berada di tengah card luar
      child: Center(
        child: Container(
          // 6. Card Putih: Ukuran 312 x 84
          width: 312,
          height: 84,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  // 3. RSWN News: Ukuran 17, Bold
                  Text(
                    data['title']!,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppColors.primaryMaroon,
                    ),
                  ),
                  // 5. Jarak RSWN News dengan Tanggal: 105
                  const SizedBox(width: 90),
                  // 4. Tanggal: Ukuran 10, Semi-Bold
                  Text(
                    data['date']!,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600, // Semi-Bold
                      color: AppColors.accentOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                data['desc']!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppColors.primaryMaroon.withOpacity(0.8),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
