import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/style.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: KStyle.c26BlackColor),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Text(
                'WHAT ',
                style: KStyle.titleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              Text(
                'I DO',
                style: KStyle.titleTextStyle.copyWith(
                  color: KStyle.cPinkOrgColor,
                  fontSize: 48,
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Services Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 2.3,
            children: [
              _buildServiceCard(
                'CROSS-PLATFORM APP DEVELOPMENT',
                'Build high-performance apps for iOS & Android using a single Flutter codebase — beautiful, responsive, and consistent.',
              ),
              _buildServiceCard(
                'STATE MANAGEMENT & PERFORMANCE',
                'Architect scalable apps using Bloc, Provider, or Riverpod while optimizing UI rendering and network efficiency.',
              ),
              _buildServiceCard(
                'API & FIREBASE INTEGRATION',
                'Connect apps to REST APIs, Firebase services (Firestore, Auth, Storage), enabling real-time updates and cloud features.',
              ),
              _buildServiceCard(
                'CUSTOM UI & ANIMATIONS',
                'Craft stunning interfaces and fluid animations, from simple layouts to complex design systems that match your brand.',
              ),
              _buildServiceCard(
                'AUTHENTICATION & APP SECURITY',
                'Implement secure login flows using Firebase Auth, OAuth, and best practices to safeguard user data.',
              ),
              _buildServiceCard(
                'TESTING, CI/CD & DEPLOYMENT',
                'Ensure app stability with unit/widget tests, and streamline deployment via GitHub Actions and stores like Play Store & App Store.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: KStyle.cWhiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Star Icon
          SvgPicture.asset(
            'assets/icons/star.svg',
            height: 30,
            width: 30,
            colorFilter: ColorFilter.mode(
              KStyle.cPinkOrgColor,
              BlendMode.srcIn,
            ),
          ),

          const SizedBox(height: 20),

          // Title
          Text(
            title,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 15),

          // Description
          Text(
            description,
            style: KStyle.paragraphTextStyle.copyWith(
              color: Colors.grey[400],
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
