part of 'retroflux_bloc.dart';

abstract class RetrofluxState extends Equatable {
  const RetrofluxState();

  @override
  List<Object> get props => [];
}

class RetrofluxInitial extends RetrofluxState {}

class RetrofluxLoading extends RetrofluxState {}

class RetrofluxLoaded extends RetrofluxState {
  final List<ProductivityLogModel> productivityLogs;

  const RetrofluxLoaded(this.productivityLogs);

  @override
  List<Object> get props => [productivityLogs];
}
