import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../constants/style.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/profile_section.dart';
import '../widgets/what_i_do_section.dart';
import '../widgets/what_did_they_say_section.dart';
import '../widgets/work_experience_section.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/contact_section.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioBloc()..add(LoadPortfolio()),
      child: const PortfolioView(),
    );
  }
}

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  late ScrollController _scrollController;

  // Section keys for navigation
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _whatIDoKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _workExperienceKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy;
    final scrollPosition =
        _scrollController.offset + position - 100; // 100px offset for nav bar

    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KStyle.c26BlackColor,
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state is PortfolioLoading) {
            return Center(
              child: CircularProgressIndicator(color: KStyle.cPinkOrgColor),
            );
          }

          if (state is PortfolioLoaded) {
            return Stack(
              children: [
                // Main scrollable content
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Spacer for fixed navigation bar
                            const SizedBox(height: 100),

                            // Profile Section
                            ProfileSection(key: _profileKey),
                          ],
                        ),
                      ),

                      // What I Do Section
                      WhatIDoSection(key: _whatIDoKey),

                      // What Did They Say Section
                      WhatDidTheySaySection(key: _testimonialsKey),

                      // Work Experience Section
                      WorkExperienceSection(key: _workExperienceKey),

                      // Portfolio Section
                      PortfolioSection(key: _portfolioKey),

                      // Contact Section
                      ContactSection(key: _contactKey),
                    ],
                  ),
                ),

                // Fixed Navigation Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomNavigationBar(
                    onNavItemTap: (section) {
                      switch (section) {
                        case 'Profile':
                          _scrollToSection(_profileKey);
                          break;
                        case 'What I Do':
                          _scrollToSection(_whatIDoKey);
                          break;
                        case 'Testimonials':
                          _scrollToSection(_testimonialsKey);
                          break;
                        case 'Work Experience':
                          _scrollToSection(_workExperienceKey);
                          break;
                        case 'Portfolio':
                          _scrollToSection(_portfolioKey);
                          break;
                        case 'Contact':
                          _scrollToSection(_contactKey);
                          break;
                      }
                    },
                  ),
                ),
              ],
            );
          }

          if (state is PortfolioError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
