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
    // {
    //   'name': 'Sarah Johnson',
    //   'role': 'UI/UX DESIGN & PROTOTYPING',
    //   'image': 'assets/images/profile.png',
    //   'text':
    //       'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
    // },
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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          // Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WHAT DID ',
                style: KStyle.titleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              Text(
                'THEY SAY',
                style: KStyle.titleTextStyle.copyWith(
                  color: KStyle.cPinkOrgColor,
                  fontSize: 48,
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Profile Image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: KStyle.cPinkOrgColor, width: 3),
              image: DecorationImage(
                image: AssetImage(currentTestimonial['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Person Name
          Text(
            currentTestimonial['name']!,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: KStyle.cPinkOrgColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 15),

          // Testimonial Title/Role
          Text(
            currentTestimonial['role']!,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 30),

          // Testimonial Text
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              currentTestimonial['text']!,
              style: KStyle.paragraphTextStyle.copyWith(
                color: Colors.white,
                fontSize: 16,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 50),

          // Navigation Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Arrow
              GestureDetector(
                onTap: _previousTestimonial,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),

              // Pagination Dots
              Row(
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

              // Right Arrow
              GestureDetector(
                onTap: _nextTestimonial,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
