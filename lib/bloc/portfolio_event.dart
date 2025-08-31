import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class LoadPortfolio extends PortfolioEvent {}

class NavigateToSection extends PortfolioEvent {
  final String section;

  const NavigateToSection(this.section);

  @override
  List<Object> get props => [section];
}
