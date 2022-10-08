import 'package:retroflux/data/models/productivity_log_model.dart';

abstract class LogViewRepository {
  void saveProductivityLogLocal(ProductivityLogModel currentLog);
}
