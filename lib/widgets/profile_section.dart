import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/style.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            // Main Profile Content
            Row(
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
                          _buildSocialIcon('assets/icons/linkedin.svg'),
                          const SizedBox(width: 20),
                          _buildSocialIcon('assets/icons/github.svg'),
                          const SizedBox(width: 20),
                          _buildSocialIcon('assets/icons/facebook.svg'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 60),

                // Right Side - Profile Image
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // Technology Icons Section
            Column(
              children: [
                Text(
                  'Technologies & Tools',
                  style: KStyle.titleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTechIcon('assets/images/flutter.png'),
                    _buildTechIcon('assets/images/java.png'),
                    _buildTechIcon('assets/images/dart.png'),
                    _buildTechIcon('assets/images/firebase.png'),
                    _buildTechIcon('assets/images/vscode.png'),
                    _buildTechIcon('assets/images/nodejs.png'),
                    _buildTechIcon('assets/images/angular.png'),
                    // _buildTechIcon('assets/images/androidstudio.png'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String iconPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(iconPath, color: KStyle.c26BlackColor),
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
