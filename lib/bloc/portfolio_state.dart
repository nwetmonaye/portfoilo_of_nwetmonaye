import 'package:equatable/equatable.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final String currentSection;

  const PortfolioLoaded({this.currentSection = 'home'});

  PortfolioLoaded copyWith({String? currentSection}) {
    return PortfolioLoaded(
      currentSection: currentSection ?? this.currentSection,
    );
  }

  @override
  List<Object> get props => [currentSection];
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError(this.message);

  @override
  List<Object> get props => [message];
}
