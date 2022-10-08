import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retroflux/core/usecase.dart';
import 'package:retroflux/data/models/productivity_log_model.dart';
import 'package:retroflux/domain/usecases/get_all_logs_usecase.dart';
import 'package:retroflux/domain/usecases/save_log_usecase.dart';

part 'retroflux_event.dart';
part 'retroflux_state.dart';

class RetrofluxBloc extends Bloc<RetrofluxEvent, RetrofluxState> {
  final GetAllLogsUsecase getAllLogsUsecase;
  final SaveLogUsecase saveLogUsecase;

  RetrofluxBloc({required this.getAllLogsUsecase, required this.saveLogUsecase})
      : super(RetrofluxInitial()) {
    on<LoadHomepageView>(_onLoadHomepageEvent);
    on<SaveLog>(_onSaveLogEvent);
  }

  void _onLoadHomepageEvent(event, emit) {
    emit(RetrofluxLoading());
    emit(RetrofluxLoaded(
        getAllLogsUsecase(NoParams()) as List<ProductivityLogModel>));
  }

  void _onSaveLogEvent(event, emit) {
    emit(RetrofluxLoading());
    saveLogUsecase(LogParams(event.productivityLogModel));
    emit(RetrofluxLoaded(
        getAllLogsUsecase(NoParams()) as List<ProductivityLogModel>));
  }
}
