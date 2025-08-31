import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../constants/style.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        String currentSection = 'home';
        if (state is PortfolioLoaded) {
          currentSection = state.currentSection;
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: KStyle.c25BlackColor,
            borderRadius: BorderRadius.circular(50),
          ),
          margin: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Flower Icon
              SvgPicture.asset(
                'assets/icons/flower.svg',
                height: 30,
                width: 30,
              ),

              const SizedBox(width: 40),

              // Navigation Items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavItem(context, 'HOME', 'home', currentSection),
                    const SizedBox(width: 40),
                    _buildNavItem(
                      context,
                      'FEATURE',
                      'feature',
                      currentSection,
                    ),
                    const SizedBox(width: 40),
                    _buildNavItem(
                      context,
                      'EXPERIENCE',
                      'experience',
                      currentSection,
                    ),
                    const SizedBox(width: 40),
                    _buildNavItem(
                      context,
                      'PORTFOLIO',
                      'portfolio',
                      currentSection,
                    ),
                  ],
                ),
              ),

              // CV Button
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
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
            ],
          ),
        );
      },
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
