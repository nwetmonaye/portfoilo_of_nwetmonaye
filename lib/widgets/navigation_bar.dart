import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../constants/style.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(String) onNavItemTap;

  const CustomNavigationBar({super.key, required this.onNavItemTap});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        String currentSection = 'home';
        if (state is PortfolioLoaded) {
          currentSection = state.currentSection;
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 768;

            if (isMobile) {
              return _buildMobileNav(context, currentSection);
            } else {
              return _buildDesktopNav(context, currentSection);
            }
          },
        );
      },
    );
  }

  Widget _buildMobileNav(BuildContext context, String currentSection) {
    if (_isDrawerOpen) {
      return _buildMobileDrawer(context, currentSection);
    } else {
      return _buildMobileNavBar(context, currentSection);
    }
  }

  Widget _buildMobileNavBar(BuildContext context, String currentSection) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: KStyle.c25BlackColor,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Flower Icon
          SvgPicture.asset('assets/icons/flower.svg', height: 30, width: 30),

          // Right side - CV Button and Hamburger
          Row(
            children: [
              // CV Button
              GestureDetector(
                onTap: () async {
                  final Uri uri = Uri.parse(
                    'https://drive.google.com/file/d/1OHO1q9EixRZhVUcwVQ9UNc9aZFzxi_6U/view?usp=sharing',
                  );
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: KStyle.cPinkOrgColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    'CV',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 15),

              // Hamburger Menu
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isDrawerOpen = true;
                  });
                },
                child: const Icon(Icons.menu, color: Colors.white, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context, String currentSection) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: KStyle.c26BlackColor,
      child: Column(
        children: [
          // Header with same nav bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: KStyle.c25BlackColor,
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Flower Icon
                SvgPicture.asset(
                  'assets/icons/flower.svg',
                  height: 30,
                  width: 30,
                ),

                // Right side - CV Button and Close
                Row(
                  children: [
                    // CV Button
                    GestureDetector(
                      onTap: () async {
                        final Uri uri = Uri.parse(
                          'https://drive.google.com/file/d/1OHO1q9EixRZhVUcwVQ9UNc9aZFzxi_6U/view?usp=sharing',
                        );
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: KStyle.cPinkOrgColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          'CV',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Close Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDrawerOpen = false;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Navigation Menu Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  _buildMobileNavItem(
                    context,
                    'HOME',
                    'Profile',
                    currentSection,
                  ),
                  const SizedBox(height: 25),
                  _buildMobileNavItem(
                    context,
                    'FEATURE',
                    'What I Do',
                    currentSection,
                  ),
                  const SizedBox(height: 25),
                  _buildMobileNavItem(
                    context,
                    'EXPERIENCE',
                    'Work Experience',
                    currentSection,
                  ),
                  const SizedBox(height: 25),
                  _buildMobileNavItem(
                    context,
                    'PORTFOLIO',
                    'Portfolio',
                    currentSection,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context, String currentSection) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: KStyle.c25BlackColor,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Flower Icon
          SvgPicture.asset('assets/icons/flower.svg', height: 30, width: 30),

          const SizedBox(width: 40),

          // Navigation Items
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavItem(context, 'Profile', 'Profile', currentSection),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  'What I Do',
                  'What I Do',
                  currentSection,
                ),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  'Testimonials',
                  'Testimonials',
                  currentSection,
                ),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  'Work Experience',
                  'Work Experience',
                  currentSection,
                ),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  'Portfolio',
                  'Portfolio',
                  currentSection,
                ),
                const SizedBox(width: 40),
                _buildNavItem(context, 'Contact', 'Contact', currentSection),
              ],
            ),
          ),

          // CV Button
          GestureDetector(
            onTap: () async {
              final Uri uri = Uri.parse(
                'https://drive.google.com/file/d/1OHO1q9EixRZhVUcwVQ9UNc9aZFzxi_6U/view?usp=sharing',
              );
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                color: KStyle.cPinkOrgColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'CV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(
    BuildContext context,
    String text,
    String section,
    String currentSection,
  ) {
    final isSelected = currentSection == section;

    return GestureDetector(
      onTap: () {
        widget.onNavItemTap(section);
        context.read<PortfolioBloc>().add(NavigateToSection(section));
        setState(() {
          _isDrawerOpen = false;
        });
      },
      child: Text(
        text,
        style: KStyle.navTextStyle.copyWith(
          color: isSelected ? KStyle.cPinkOrgColor : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String text,
    String section,
    String currentSection,
  ) {
    final isSelected = currentSection == section;

    return GestureDetector(
      onTap: () {
        widget.onNavItemTap(section);
        context.read<PortfolioBloc>().add(NavigateToSection(section));
      },
      child: Text(
        text,
        style: KStyle.navTextStyle.copyWith(
          color: isSelected ? KStyle.cPinkOrgColor : Colors.white,
        ),
      ),
    );
  }
}
