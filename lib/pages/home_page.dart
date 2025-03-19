import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homei/components/custom_app_bar.dart';
import 'package:homei/components/device_item.dart';
import 'package:homei/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> mySmartDevices = [
    ["Smart AC", "assets/images/takif.png", false],
    ["Smart TV", "assets/images/tv.png", false],
    ["Smart Fan", "assets/images/fan.png", false],
    ["Smart Light", "assets/images/lamba.png", false],
  ];
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "Gojo Satoru",
                    style: GoogleFonts.bebasNeue(fontSize: 74),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: hPadding),
              child: Divider(thickness: 1, color: Colors.grey[500]),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Smart Devices",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return DeviceItem(
                    onChanged: (value) {
                      powerSwitchChanged(value, index);
                    },
                    name: mySmartDevices[index][0],
                    status: mySmartDevices[index][2],
                    image: mySmartDevices[index][1],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
