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

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          child: Column(
            children: [
              // Main Profile Content
              isMobile
                  ? _buildMobileProfileContent()
                  : _buildDesktopProfileContent(),

              SizedBox(height: isMobile ? 40 : 80),

              // Technology Icons Section
              Column(
                children: [
                  Text(
                    'Technologies & Tools',
                    style: KStyle.titleTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 24 : 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  isMobile ? _buildMobileTechIcons() : _buildDesktopTechIcons(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileProfileContent() {
    return Column(
      children: [
        // Profile Image (Top on mobile)
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 30),

        // Name
        Text(
          'NWET',
          style: KStyle.headingTextStyle.copyWith(
            color: KStyle.cPinkOrgColor,
            fontSize: 50,
          ),
        ),
        Text(
          'MON AYE',
          style: KStyle.headingTextStyle.copyWith(
            color: KStyle.cPinkOrgColor,
            fontSize: 50,
          ),
        ),

        const SizedBox(height: 20),

        // About Paragraph
        Text(
          'A seasoned developer with a strong background in both full-stack web development and mobile application development. Possessing extensive experience gained from prestigious institutions at Myanmar Information Technology, coupled with proficiency in a range of technologies including Node.js, Java, Angular, and Flutter. Proven expertise in utilizing industry-standard design patterns such as MVC and BLoC to build robust and scalable applications. Now I\'m currently working at BIM group of Company as a mobile application developer.',
          style: KStyle.paragraphTextStyle.copyWith(
            color: Colors.white,
            fontSize: 14,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 30),

        // Social Media Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
              'assets/icons/linkedin.svg',
              'https://www.linkedin.com/in/nwet-mon-aye-029b27260/',
            ),
            const SizedBox(width: 15),
            _buildSocialIcon(
              'assets/icons/github.svg',
              'https://github.com/nwetmonaye',
            ),
            const SizedBox(width: 15),
            _buildSocialIcon(
              'assets/icons/facebook.svg',
              'https://www.facebook.com/nwetmon.aye/',
            ),
            const SizedBox(width: 15),
            _buildSocialIcon(
              'assets/icons/instagram.svg',
              'https://www.instagram.com/nwetmonaye7/',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopProfileContent() {
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
                  color: Colors.white,
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
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    'assets/icons/github.svg',
                    'https://github.com/nwetmonaye',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    'assets/icons/facebook.svg',
                    'https://www.facebook.com/nwetmon.aye/',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    'assets/icons/instagram.svg',
                    'https://www.instagram.com/nwetmonaye7/',
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

  Widget _buildMobileTechIcons() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        _buildTechIcon('assets/images/flutter.png'),
        _buildTechIcon('assets/images/java.png'),
        _buildTechIcon('assets/images/dart.png'),
        _buildTechIcon('assets/images/firebase.png'),
        _buildTechIcon('assets/images/vscode.png'),
        _buildTechIcon('assets/images/nodejs.png'),
        _buildTechIcon('assets/images/angular.png'),
      ],
    );
  }

  Widget _buildDesktopTechIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTechIcon('assets/images/flutter.png'),
        _buildTechIcon('assets/images/java.png'),
        _buildTechIcon('assets/images/dart.png'),
        _buildTechIcon('assets/images/firebase.png'),
        _buildTechIcon('assets/images/vscode.png'),
        _buildTechIcon('assets/images/nodejs.png'),
        _buildTechIcon('assets/images/angular.png'),
      ],
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
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(iconPath, color: KStyle.c26BlackColor),
        ),
      ),
    );
  }

  Widget _buildTechIcon(String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Image.asset(imgPath, fit: BoxFit.contain),
    );
  }
}
