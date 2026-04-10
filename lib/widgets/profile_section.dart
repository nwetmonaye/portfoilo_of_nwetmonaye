import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/style.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;
        final bool isDark = Theme.of(context).brightness == Brightness.dark;
        final Color paragraphTextColor =
            isDark ? Colors.white : Colors.black87.withOpacity(0.8);

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 18 : 40),
          child: Column(
            children: [
              // Main Profile Content
              isMobile
                  ? _buildMobileProfileContent(
                      paragraphTextColor,
                      isDark,
                    )
                  : _buildDesktopProfileContent(
                      paragraphTextColor,
                      isDark,
                    ),

              SizedBox(height: isMobile ? 40 : 80),

              // Technology Icons Section
              Column(
                children: [
                  Text(
                    'Technologies & Tools',
                    style: KStyle.titleTextStyle.copyWith(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: isMobile ? 24 : 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  isMobile
                      ? _buildMobileTechIcons(isDark)
                      : _buildDesktopTechIcons(isDark),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileProfileContent(
    Color paragraphTextColor,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile Image (Top on mobile) with light-friendly frame
        Container(
          decoration: BoxDecoration(
            gradient: isDark
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.grey.shade100],
                  ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              if (!isDark)
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 22,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 240,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: KStyle.cPinkOrgColor.withOpacity(0.25),
                  blurRadius: 30,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Name
            Text(
              'NWET MON AYE',
              style: KStyle.headingTextStyle.copyWith(
                color: KStyle.cPinkOrgColor,
                fontSize: 34,
              ),
            ),

            const SizedBox(height: 20),

            // About Paragraph
            Text(
              'A seasoned developer with a strong background in both full-stack web development and mobile application development. Possessing extensive experience gained from prestigious institutions at Myanmar Information Technology, coupled with proficiency in a range of technologies including Node.js, Java, Angular, and Flutter. Proven expertise in utilizing industry-standard design patterns such as MVC and BLoC to build robust and scalable applications. Now I\'m currently working at BIM group of Company as a mobile application developer.',
              style: KStyle.paragraphTextStyle.copyWith(
                color: paragraphTextColor,
                fontSize: 13.5,
                height: 1.6,
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 30),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(
                  'assets/icons/linkedin.svg',
                  'https://www.linkedin.com/in/nwet-mon-aye-029b27260/',
                  isDark: isDark,
                ),
                const SizedBox(width: 15),
                _buildSocialIcon(
                  'assets/icons/github.svg',
                  'https://github.com/nwetmonaye',
                  isDark: isDark,
                ),
                const SizedBox(width: 15),
                _buildSocialIcon(
                  'assets/icons/facebook.svg',
                  'https://www.facebook.com/nwetmon.aye/',
                  isDark: isDark,
                ),
                const SizedBox(width: 15),
                _buildSocialIcon(
                  'assets/icons/instagram.svg',
                  'https://www.instagram.com/nwetmonaye7/',
                  isDark: isDark,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopProfileContent(
    Color paragraphTextColor,
    bool isDark,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side - Text Content
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                'NWET',
                style: KStyle.headingTextStyle.copyWith(
                  color: KStyle.cPinkOrgColor,
                  fontSize: 80,
                ),
              ),
              Text(
                'MON AYE',
                style: KStyle.headingTextStyle.copyWith(
                  color: KStyle.cPinkOrgColor,
                  fontSize: 80,
                ),
              ),

              const SizedBox(height: 30),

              // About Paragraph
              Text(
                'A seasoned developer with a strong background in both full-stack web development and mobile application development. Possessing extensive experience gained from prestigious institutions at Myanmar Information Technology, coupled with proficiency in a range of technologies including Node.js, Java, Angular, and Flutter. Proven expertise in utilizing industry-standard design patterns such as MVC and BLoC to build robust and scalable applications. Now I\'m currently working at BIM group of Company as a mobile application developer.',
                style: KStyle.paragraphTextStyle.copyWith(
                  color: paragraphTextColor,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 40),

              // Social Media Icons
              Row(
                children: [
                  _buildSocialIcon(
                    'assets/icons/linkedin.svg',
                    'https://www.linkedin.com/in/nwet-mon-aye-029b27260/',
                    isDark: isDark,
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    'assets/icons/github.svg',
                    'https://github.com/nwetmonaye',
                    isDark: isDark,
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    'assets/icons/facebook.svg',
                    'https://www.facebook.com/nwetmon.aye/',
                    isDark: isDark,
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    'assets/icons/instagram.svg',
                    'https://www.instagram.com/nwetmonaye7/',
                    isDark: isDark,
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 70),

        // Right Side - Profile Image
        Expanded(
          flex: 1,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTechIcons(bool isDark) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildMobileTechIconWithLabel(
            'assets/images/flutter.png',
            'Flutter',
            isDark,
          ),
          const SizedBox(width: 20),
          _buildMobileTechIconWithLabel('assets/images/java.png', 'Java', isDark),
          const SizedBox(width: 20),
          _buildMobileTechIconWithLabel('assets/images/dart.png', 'Dart', isDark),
          const SizedBox(width: 20),
          _buildMobileTechIconWithLabel(
            'assets/images/firebase.png',
            'Firebase',
            isDark,
          ),
          const SizedBox(width: 20),
          _buildMobileTechIconWithLabel(
            'assets/images/vscode.png',
            'VS Code',
            isDark,
          ),
          const SizedBox(width: 20),
          _buildMobileTechIconWithLabel(
            'assets/images/nodejs.png',
            'Node.js',
            isDark,
          ),
          const SizedBox(width: 20),
          _buildMobileTechIconWithLabel(
            'assets/images/angular.png',
            'Angular',
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTechIconWithLabel(
    String imgPath,
    String label,
    bool isDark,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withOpacity(0.1) : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.white.withOpacity(0.08) : Colors.black12,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.18 : 0.08),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(imgPath, fit: BoxFit.contain),
          ),
        ),
        // const SizedBox(height: 8),
        // Text(
        //   label,
        //   style: KStyle.paragraphTextStyle.copyWith(
        //     color: Colors.white,
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }

  Widget _buildDesktopTechIcons(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTechIcon('assets/images/flutter.png', isDark),
        _buildTechIcon('assets/images/java.png', isDark),
        _buildTechIcon('assets/images/dart.png', isDark),
        _buildTechIcon('assets/images/firebase.png', isDark),
        _buildTechIcon('assets/images/vscode.png', isDark),
        _buildTechIcon('assets/images/nodejs.png', isDark),
        _buildTechIcon('assets/images/angular.png', isDark),
      ],
    );
  }

  Widget _buildSocialIcon(String iconPath, String url,
      {required bool isDark}) {
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
          color: isDark ? Colors.white : Colors.black,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            iconPath,
            color: isDark ? KStyle.c26BlackColor : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTechIcon(String imgPath, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.06) : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? Colors.white.withOpacity(0.08) : Colors.black12,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.2 : 0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Image.asset(imgPath, height: 38, fit: BoxFit.contain),
      ),
    );
  }
}
