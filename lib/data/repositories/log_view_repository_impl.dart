import 'package:retroflux/data/datasources/local_datasource.dart';

import '../../domain/repositories/log_view_repository.dart';
import '../models/productivity_log_model.dart';

class LogViewRepositoryImpl extends LogViewRepository {
  final LocalDataSource localDataSource;

  LogViewRepositoryImpl({required this.localDataSource});

  @override
  void saveProductivityLogLocal(ProductivityLogModel currentLog) {
    localDataSource.saveData(currentLog);
  }
}
