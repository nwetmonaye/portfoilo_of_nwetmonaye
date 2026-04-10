import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/style.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 768;
        final bool isTablet = constraints.maxWidth < 1100 && !isMobile;
        final int crossAxisCount = isMobile
            ? 1
            : isTablet
                ? 2
                : 3;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(color: KStyle.c26BlackColor),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 40,
            vertical: isMobile ? 30 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'WHAT ',
                    style: KStyle.titleTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 48,
                    ),
                  ),
                  Text(
                    'I DO',
                    style: KStyle.titleTextStyle.copyWith(
                      color: KStyle.cPinkOrgColor,
                      fontSize: isMobile ? 28 : 48,
                    ),
                  ),
                  if (isMobile)
                    Container(
                      margin: const EdgeInsets.only(left: 8, bottom: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: KStyle.cPinkOrgColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),

              SizedBox(height: isMobile ? 24 : 60),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: isMobile ? 16 : 32,
                  mainAxisSpacing: isMobile ? 16 : 32,
                  childAspectRatio: isMobile ? 1.35 : 2.1,
                ),
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return _buildServiceCard(
                    service['title']!,
                    service['description']!,
                    isMobile: isMobile,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceCard(
    String title,
    String description, {
    bool isMobile = false,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 18 : 25),
      decoration: BoxDecoration(
        color: KStyle.cWhiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          Text(
            title,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: KStyle.paragraphTextStyle.copyWith(
              color: Colors.grey[400],
              fontSize: isMobile ? 13 : 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  static const List<Map<String, String>> _services = [
    {
      'title': 'CROSS-PLATFORM APP DEVELOPMENT',
      'description':
          'Build high-performance apps for iOS & Android using a single Flutter codebase — beautiful, responsive, and consistent.',
    },
    {
      'title': 'STATE MANAGEMENT & PERFORMANCE',
      'description':
          'Architect scalable apps using Bloc, Provider, or Riverpod while optimizing UI rendering and network efficiency.',
    },
    {
      'title': 'API & FIREBASE INTEGRATION',
      'description':
          'Connect apps to REST APIs, Firebase services (Firestore, Auth, Storage), enabling real-time updates and cloud features.',
    },
    {
      'title': 'CUSTOM UI & ANIMATIONS',
      'description':
          'Craft polished interfaces and fluid animations, from simple layouts to design systems that match your brand.',
    },
    {
      'title': 'AUTHENTICATION & APP SECURITY',
      'description':
          'Implement secure login flows using Firebase Auth, OAuth, and best practices to safeguard user data.',
    },
    {
      'title': 'TESTING, CI/CD & DEPLOYMENT',
      'description':
          'Ensure stability with unit/widget tests and streamline deployment via GitHub Actions plus app stores.',
    },
  ];
}
