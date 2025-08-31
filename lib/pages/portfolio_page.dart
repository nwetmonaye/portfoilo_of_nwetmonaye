import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../constants/style.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/profile_section.dart';

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

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

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
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Navigation Section
                  const CustomNavigationBar(),

                  // Profile Section
                  const ProfileSection(),

                  // TODO: Add other sections here
                  // What I Do Section
                  // What Did They Say Section
                  // Work Experience Section
                  // My Portfolio Section
                  // Contact Section
                ],
              ),
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
