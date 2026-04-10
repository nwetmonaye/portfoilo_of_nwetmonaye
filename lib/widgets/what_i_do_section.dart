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
        final bool isDark = Theme.of(context).brightness == Brightness.dark;
        final int crossAxisCount = isMobile
            ? 1
            : isTablet
                ? 2
                : 3;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? KStyle.c26BlackColor : Colors.white,
          ),
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
                      color: isDark ? Colors.white : Colors.black87,
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
                  // Taller cells on web/desktop so title + body fit without overflow.
                  childAspectRatio: isMobile ? 1.25 : 1.75,
                ),
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return _buildServiceCard(
                    context,
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
    BuildContext context,
    String title,
    String description, {
    bool isMobile = false,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(isMobile ? 18 : 25),
      decoration: BoxDecoration(
        color: isDark ? KStyle.cWhiteColor.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              isDark ? Colors.white.withOpacity(0.05) : Colors.black12,
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
        children: [
          SvgPicture.asset(
            'assets/icons/star.svg',
            height: isMobile ? 28 : 26,
            width: isMobile ? 28 : 26,
            colorFilter: ColorFilter.mode(
              KStyle.cPinkOrgColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 10),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: isDark ? Colors.white : Colors.black87,
              fontSize: isMobile ? 14 : 15,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 6),
          Expanded(
            child: Text(
              description,
              maxLines: isMobile ? 8 : 6,
              overflow: TextOverflow.ellipsis,
              style: KStyle.paragraphTextStyle.copyWith(
                color: isDark ? Colors.grey[400] : Colors.black54,
                fontSize: isMobile ? 12.5 : 13,
                height: 1.45,
              ),
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
