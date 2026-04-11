import 'package:flutter/material.dart';
import '../constants/style.dart';

class WhatDidTheySaySection extends StatefulWidget {
  const WhatDidTheySaySection({super.key});

  @override
  State<WhatDidTheySaySection> createState() => _WhatDidTheySaySectionState();
}

class _WhatDidTheySaySectionState extends State<WhatDidTheySaySection> {
  int _currentIndex = 0;

  final List<Map<String, String>> _testimonials = [
    {
      'name': 'Kaung Khant Kyaw',
      'role': 'Senior Developer',
      'image': 'assets/images/kkk.jpg',
      'text':
          'I confidently recommend Nwet Mon Aye as a junior developer. She is hardworking, reliable, and has demonstrated both technical ability and strong potential for growth. Any development team would benefit from having her.',
    },
    {
      'name': 'Thant Zin Linn',
      'role': 'Senior Developer',
      'image': 'assets/images/tzl.jpg',
      'text':
          'I am pleased to recommend Nwet Mon Aye, who worked as a Mobile Developer specializing in Flutter at MIT. They demonstrated strong skills in building cross-platform mobile applications, problem-solving, and writing clean, maintainable code. Nwet Mon Aye is responsible, detail-oriented, and works effectively both independently and within a team. I am confident they will be a valuable asset to any organization.',
    },
    // {
    //   'name': 'Michael Chen',
    //   'role': 'MOBILE APP DEVELOPMENT',
    //   'image': 'assets/images/profile.png',
    //   'text':
    //       'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.',
    // },
  ];

  void _nextTestimonial() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _testimonials.length;
    });
  }

  void _previousTestimonial() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _testimonials.length) % _testimonials.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTestimonial = _testimonials[_currentIndex];

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 768;
        final bool isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 40,
            vertical: isMobile ? 30 : 40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WHAT DID ',
                    style: KStyle.titleTextStyle.copyWith(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: isMobile ? 26 : 48,
                    ),
                  ),
                  Text(
                    'THEY SAY',
                    style: KStyle.titleTextStyle.copyWith(
                      color: KStyle.cPinkOrgColor,
                      fontSize: isMobile ? 26 : 48,
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 32 : 60),

              Container(
                width: isMobile ? 100 : 120,
                height: isMobile ? 100 : 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? KStyle.cWhiteColor : Colors.black54,
                    width: 3,
                  ),
                  image: DecorationImage(
                    image: AssetImage(currentTestimonial['image']!),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                currentTestimonial['name']!,
                style: KStyle.paraTitleTextStyle.copyWith(
                  color: isDark ? KStyle.cWhiteColor : Colors.black87,
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                currentTestimonial['role']!,
                style: KStyle.paraTitleTextStyle.copyWith(
                  color: isDark ? Colors.white : Colors.black87,
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                constraints: BoxConstraints(maxWidth: isMobile ? 500 : 800),
                child: Text(
                  currentTestimonial['text']!,
                  style: KStyle.paragraphTextStyle.copyWith(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: isMobile ? 30 : 50),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 12,
                children: [
                  _buildNavButton(
                    icon: Icons.chevron_left,
                    onTap: _previousTestimonial,
                    isMobile: isMobile,
                    isDark: isDark,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _testimonials.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7.5),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: index == _currentIndex
                              ? KStyle.cPinkOrgColor
                              : Colors.grey[600],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  _buildNavButton(
                    icon: Icons.chevron_right,
                    onTap: _nextTestimonial,
                    isMobile: isMobile,
                    isDark: isDark,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isMobile,
    required bool isDark,
  }) {
    final Color iconColor =
        isDark ? Colors.white : Colors.black87;
    final Color bgColor = isDark
        ? Colors.white.withOpacity(0.1)
        : Colors.grey.shade200;
    final Color borderColor = isDark
        ? Colors.white.withOpacity(0.2)
        : Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 12 : 15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: isMobile ? 24 : 30,
        ),
      ),
    );
  }
}
