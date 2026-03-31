import 'package:flutter/material.dart';
import 'data/doctor_data.dart';
import 'appcolors.dart';

class DoctorSchedulePage extends StatelessWidget {
  const DoctorSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todayDoctors = doctors
        .where((d) => d["availableToday"] == true)
        .toList();

    final allDoctors = doctors
        .where((d) => d["availableToday"] == false)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),

              // 🔙 BACK
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: AppColors.primaryMaroon),
                        const SizedBox(width: 5),
                        Text(
                          "Back",
                          style: TextStyle(
                            color: AppColors.primaryMaroon,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 🏥 TITLE
              Text(
                "Doctor’s Schedule",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentOrange,
                ),
              ),

              const SizedBox(height: 25),

              // ===== AVAILABLE TODAY =====
              Text(
                "Available Today",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryMaroon,
                ),
              ),

              const SizedBox(height: 6),

              // 🔥 GARIS TIPIS
              Container(height: 1, width: 60, color: AppColors.accentOrange),

              const SizedBox(height: 15),

              ...todayDoctors.map((doc) => _doctorCard(doc)),

              const SizedBox(height: 25),

              // ===== ALL DOCTORS =====
              Text(
                "All Doctors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryMaroon,
                ),
              ),

              const SizedBox(height: 6),

              // 🔥 GARIS TIPIS
              Container(height: 1, width: 60, color: AppColors.accentOrange),

              const SizedBox(height: 15),

              ...allDoctors.map((doc) => _doctorCard(doc)),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _doctorCard(Map<String, dynamic> doc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      height: 100,
      child: Stack(
        children: [
          // 🟧 ORANGE CARD (KANAN)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.accentOrange,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.primaryMaroon,
                  width: 1, // 🔥 tipis
                ),
              ),
            ),
          ),

          // ⬜ WHITE CARD (DEPAN)
          Positioned(
            left: 0,
            right: 30,
            top: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.primaryMaroon,
                  width: 1, // 🔥 tipis
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // 🖼 FOTO KOTAK
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/dokter.jpg',
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // 📄 INFO
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          doc["specialist"],
                          style: TextStyle(
                            color: AppColors.accentOrange,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // ⏰ TIME BADGE
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryMaroon.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 12,
                                color: AppColors.primaryMaroon,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                doc["time"],
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.primaryMaroon,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ➡️ ARROW DI ORANGE
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
