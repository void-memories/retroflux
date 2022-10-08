part of 'retroflux_bloc.dart';

abstract class RetrofluxEvent extends Equatable {
  const RetrofluxEvent();

  @override
  List<Object> get props => [];
}

class LoadHomepageView extends RetrofluxEvent {}

class SaveLog extends RetrofluxEvent {
  final ProductivityLogModel productivityLogModel;

  const SaveLog(this.productivityLogModel);

  @override
  List<Object> get props => [productivityLogModel];
}
