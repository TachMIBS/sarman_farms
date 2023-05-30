import 'dart:async';

import 'package:sarman_farms/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/global_variables.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => const MyApp());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/my_logo.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'SarmanFarm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
