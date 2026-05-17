import 'package:flutter/material.dart';
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
        final double spacing = isMobile ? 16 : 24;
        final int crossAxisCount = isMobile
            ? 1
            : isTablet
                ? 2
                : 3;
        final double horizontalPadding = isMobile ? 18 : 40;
        final double contentWidth = constraints.maxWidth - horizontalPadding * 2;
        final double cardWidth =
            (contentWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? KStyle.c26BlackColor : Colors.white,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
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
              SizedBox(height: isMobile ? 24 : 48),
              Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(
                  _services.length,
                  (index) => SizedBox(
                    width: isMobile ? contentWidth : cardWidth,
                    child: _AnimatedServiceCard(
                      index: index,
                      title: _services[index]['title']!,
                      description: _services[index]['description']!,
                      icon: _services[index]['icon']!,
                      isMobile: isMobile,
                      isDark: isDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static const List<Map<String, dynamic>> _services = [
    {
      'title': 'Cross-Platform App Development',
      'description':
          'Build high-performance apps for iOS & Android using a single Flutter codebase — beautiful, responsive, and consistent.',
      'icon': Icons.phone_iphone_rounded,
    },
    {
      'title': 'State Management & Performance',
      'description':
          'Architect scalable apps using Bloc, Provider, or Riverpod while optimizing UI rendering and network efficiency.',
      'icon': Icons.hub_rounded,
    },
    {
      'title': 'API & Firebase Integration',
      'description':
          'Connect apps to REST APIs, Firebase services (Firestore, Auth, Storage), enabling real-time updates and cloud features.',
      'icon': Icons.cloud_sync_rounded,
    },
    {
      'title': 'Custom UI & Animations',
      'description':
          'Craft polished interfaces and fluid animations, from simple layouts to design systems that match your brand.',
      'icon': Icons.palette_rounded,
    },
    {
      'title': 'Authentication & App Security',
      'description':
          'Implement secure login flows using Firebase Auth, OAuth, and best practices to safeguard user data.',
      'icon': Icons.shield_rounded,
    },
    {
      'title': 'Testing, CI/CD & Deployment',
      'description':
          'Ensure stability with unit/widget tests and streamline deployment via GitHub Actions plus app stores.',
      'icon': Icons.rocket_launch_rounded,
    },
  ];
}

class _AnimatedServiceCard extends StatefulWidget {
  final int index;
  final String title;
  final String description;
  final IconData icon;
  final bool isMobile;
  final bool isDark;

  const _AnimatedServiceCard({
    required this.index,
    required this.title,
    required this.description,
    required this.icon,
    required this.isMobile,
    required this.isDark,
  });

  @override
  State<_AnimatedServiceCard> createState() => _AnimatedServiceCardState();
}

class _AnimatedServiceCardState extends State<_AnimatedServiceCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOutCubic,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOutCubic,
    ));

    Future<void>.delayed(Duration(milliseconds: 80 * widget.index), () {
      if (mounted) _entranceController.forward();
    });
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.isDark;
    final Color accent = KStyle.cPinkOrgColor;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: AnimatedScale(
            scale: _hovered ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.all(widget.isMobile ? 20 : 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          const Color(0xFF232328),
                          const Color(0xFF1C1C20),
                        ]
                      : [
                          Colors.white,
                          const Color(0xFFFAF8F9),
                        ],
                ),
                border: Border.all(
                  color: _hovered
                      ? accent.withOpacity(0.45)
                      : (isDark
                          ? Colors.white.withOpacity(0.08)
                          : Colors.black.withOpacity(0.06)),
                  width: _hovered ? 1.5 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _hovered
                        ? accent.withOpacity(isDark ? 0.18 : 0.12)
                        : Colors.black.withOpacity(isDark ? 0.25 : 0.05),
                    blurRadius: _hovered ? 28 : 16,
                    offset: Offset(0, _hovered ? 10 : 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _hovered
                          ? accent.withOpacity(0.18)
                          : accent.withOpacity(isDark ? 0.12 : 0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      size: widget.isMobile ? 22 : 24,
                      color: accent.withOpacity(_hovered ? 1 : 0.85),
                    ),
                  ),
                  SizedBox(height: widget.isMobile ? 14 : 16),
                  Text(
                    widget.title,
                    style: KStyle.paraTitleTextStyle.copyWith(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: widget.isMobile ? 15 : 16,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: KStyle.paragraphTextStyle.copyWith(
                      color: isDark ? Colors.grey[400] : Colors.black54,
                      fontSize: widget.isMobile ? 13 : 13.5,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
