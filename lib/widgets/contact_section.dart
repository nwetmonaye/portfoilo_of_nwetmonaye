import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/style.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 768;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 40,
            vertical: isMobile ? 28 : 40,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                isDark ? KStyle.c26BlackColor : const Color(0xFFF4F5F8),
                isDark ? const Color(0xFF2A1B2A) : Colors.white,
              ],
            ),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONTACT WITH ME',
                      style: KStyle.titleTextStyle.copyWith(
                        color: KStyle.cPinkOrgColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'nwetmon7@gmail.com',
                      style: KStyle.paragraphTextStyle.copyWith(
                        color: isDark ? Colors.grey[300] : Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '+959982284320 , +84374860146',
                      style: KStyle.paragraphTextStyle.copyWith(
                        color: isDark ? Colors.grey[300] : Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'SOCIAL',
                      style: KStyle.paraTitleTextStyle.copyWith(
                        color: isDark ? Colors.grey[300] : Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 14,
                      runSpacing: 10,
                      children: _socials
                          .map(
                            (s) => _buildSocialIcon(s['icon']!, s['url']!),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'COPYRIGHT 2025',
                      style: KStyle.paragraphTextStyle.copyWith(
                        color: isDark ? Colors.grey[400] : Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CONTACT WITH ME',
                            style: KStyle.titleTextStyle.copyWith(
                              color: KStyle.cPinkOrgColor,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'nwetmon7@gmail.com',
                            style: KStyle.paragraphTextStyle.copyWith(
                              color: isDark ? Colors.grey[300] : Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '+959982284320 , +84374860146',
                            style: KStyle.paragraphTextStyle.copyWith(
                              color: isDark ? Colors.grey[300] : Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'COPYRIGHT 2025',
                            style: KStyle.paragraphTextStyle.copyWith(
                              color: isDark ? Colors.grey[400] : Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'SOCIAL',
                            style: KStyle.paraTitleTextStyle.copyWith(
                              color: isDark ? Colors.grey[300] : Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: _socials
                                .map(
                                  (s) => Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: _buildSocialIcon(
                                      s['icon']!,
                                      s['url']!,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'MADE BY',
                            style: KStyle.paragraphTextStyle.copyWith(
                              color: isDark ? Colors.grey[400] : Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
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

  static const List<Map<String, String>> _socials = [
    {
      'icon': 'assets/icons/facebook.svg',
      'url': 'https://www.facebook.com/nwetmon.aye/',
    },
    {
      'icon': 'assets/icons/github.svg',
      'url': 'https://github.com/nwetmonaye',
    },
    {
      'icon': 'assets/icons/linkedin.svg',
      'url': 'https://www.linkedin.com/in/nwet-mon-aye-029b27260/',
    },
    {
      'icon': 'assets/icons/instagram.svg',
      'url': 'https://www.instagram.com/nwetmonaye7/',
    },
  ];
}
