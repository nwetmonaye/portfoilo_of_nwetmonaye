import 'package:flutter_bloc/flutter_bloc.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioInitial()) {
    on<LoadPortfolio>(_onLoadPortfolio);
    on<NavigateToSection>(_onNavigateToSection);
  }

  void _onLoadPortfolio(LoadPortfolio event, Emitter<PortfolioState> emit) {
    emit(PortfolioLoading());
    emit(const PortfolioLoaded(currentSection: 'home'));
  }

  void _onNavigateToSection(
    NavigateToSection event,
    Emitter<PortfolioState> emit,
  ) {
    if (state is PortfolioLoaded) {
      final currentState = state as PortfolioLoaded;
      emit(currentState.copyWith(currentSection: event.section));
    }
  }
}
