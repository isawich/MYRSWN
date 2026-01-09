import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Appointments",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFF3A43B),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE57373).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Upcoming Appointments"),
                    const SizedBox(height: 18),
                    _appointmentCard(
                      title: "Fisioterapi",
                      doctor: "dr. Yanto Kopling, S.KFR",
                      date: "MON",
                      day: "27",
                      clinic: "Klinik Rehabilitas Medik, RSWN",
                      time: "09.30 - 10.00 WIB",
                      isUpcoming: true,
                    ),
                    const SizedBox(height: 18),
                    _appointmentCard(
                      title: "Perawatan Gigi",
                      doctor: "dr. Sugeng Saklar, S.KG",
                      date: "SUN",
                      day: "03",
                      clinic: "Klinik Gigi Konservasi, RSWN",
                      time: "12.30 - 14.00 WIB",
                      isUpcoming: true,
                    ),
                    const SizedBox(height: 30),
                    _buildSectionTitle("Appointment History"),
                    const SizedBox(height: 18),
                    ..._buildHistoryList(),
                  ],
                ),
              ),
              const SizedBox(height: 120),
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF801E1D),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 2,
          width: double.infinity,
          color: const Color(0xFF801E1D),
        ),
      ],
    );
  }

  Widget _appointmentCard({
    required String title,
    required String doctor,
    required String date,
    required String day,
    required String clinic,
    required String time,
    bool isUpcoming = false,
  }) {
    Color outerBg = isUpcoming
        ? const Color(0xFFF3A43B)
        : const Color(0xFFBDBDBD);
    Color primaryColor = const Color(0xFF801E1D); // Maroon
    Color secondaryColor = isUpcoming ? const Color(0xFFF3A43B) : Colors.grey;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: outerBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // KOTAK TANGGAL
            Container(
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isUpcoming ? secondaryColor : Colors.grey[600],
                    ),
                  ),
                  Text(
                    day,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: isUpcoming ? primaryColor : Colors.grey[600],
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),

            // SPACING ANTAR KOTAK (Diubah menjadi 5)
            const SizedBox(width: 5),

            // DETAIL INFORMASI
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isUpcoming ? primaryColor : Colors.grey[600],
                      ),
                    ),
                    Text(
                      doctor,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600, // Diubah menjadi SemiBold
                        color: isUpcoming
                            ? const Color(0xFFF3A43B)
                            : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12,
                          // Warna icon disamakan dengan judul (Maroon) jika upcoming
                          color: isUpcoming ? primaryColor : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            clinic,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              // Warna teks disamakan dengan judul (Maroon) jika upcoming
                              color: isUpcoming ? primaryColor : Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12,
                          // Warna icon disamakan dengan judul (Maroon) jika upcoming
                          color: isUpcoming ? primaryColor : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            // Warna teks disamakan dengan judul (Maroon) jika upcoming
                            color: isUpcoming ? primaryColor : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHistoryList() {
    final List<Map<String, String>> histories = [
      {"doctor": "dr. Nanang Ismail, S.KFR"},
      {"doctor": "dr. Jajang Sokbreker, S.KFR"},
    ];

    return histories.map((data) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: _appointmentCard(
          title: "Fisioterapi",
          doctor: data['doctor']!,
          date: "MON",
          day: "27",
          clinic: "Klinik Rehabilitas Medik, RSWN",
          time: "09.30 WIB",
          isUpcoming: false,
        ),
      );
    }).toList();
  }
}
