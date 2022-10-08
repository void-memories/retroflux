import 'package:retroflux/core/usecase.dart';
import 'package:retroflux/data/models/productivity_log_model.dart';
import 'package:retroflux/domain/repositories/log_view_repository.dart';

class SaveLogUsecase extends Usecase<void, LogParams> {
  final LogViewRepository repository;

  SaveLogUsecase({required this.repository});

  @override
  void call(LogParams params) {
    repository.saveProductivityLogLocal(params.productivityLog);
  }
}

class LogParams {
  final ProductivityLogModel productivityLog;

  LogParams(this.productivityLog);
}
