import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/style.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            KStyle.c26BlackColor,
            Color(0xFF2A1B2A), // Dark reddish-purple
          ],
        ),
      ),
      child: SizedBox(
        height: 300, // Fixed height to prevent layout issues
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Section - Contact Information
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'CONTACT WITH ME',
                    style: KStyle.titleTextStyle.copyWith(
                      color: KStyle.cPinkOrgColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Email
                  Text(
                    'nwetmon7@gmail.com',
                    style: KStyle.paragraphTextStyle.copyWith(
                      color: Colors.grey[300],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Phone Numbers
                  Text(
                    '+959982284320 , +84374860146',
                    style: KStyle.paragraphTextStyle.copyWith(
                      color: Colors.grey[300],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 80), // Fixed spacing instead of Spacer
                  // Copyright
                  Text(
                    'COPYRIGHT 2025',
                    style: KStyle.paragraphTextStyle.copyWith(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 60),

            // Right Section - Social Media
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Social Title
                  Text(
                    'SOCIAL',
                    style: KStyle.paraTitleTextStyle.copyWith(
                      color: Colors.grey[300],
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Social Media Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildSocialIcon(
                        'assets/icons/facebook.svg',
                        'https://www.facebook.com/nwetmon.aye/',
                      ),
                      const SizedBox(width: 20),
                      _buildSocialIcon(
                        'assets/icons/github.svg',
                        'https://github.com/nwetmonaye',
                      ),
                      const SizedBox(width: 20),
                      _buildSocialIcon(
                        'assets/icons/linkedin.svg',
                        'https://www.linkedin.com/in/nwet-mon-aye-029b27260/',
                      ),
                      const SizedBox(width: 20),
                      _buildSocialIcon(
                        'assets/icons/instagram.svg',
                        'https://www.instagram.com/nwetmonaye7/',
                      ),
                    ],
                  ),

                  const SizedBox(height: 80), // Fixed spacing instead of Spacer
                  // Made By Text
                  Text(
                    'MADE BY',
                    style: KStyle.paragraphTextStyle.copyWith(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String iconPath, String url) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: KStyle.c25BlackColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[700]!, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
