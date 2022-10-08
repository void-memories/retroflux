import 'package:retroflux/data/datasources/local_datasource.dart';
import 'package:retroflux/data/models/productivity_log_model.dart';
import 'package:retroflux/domain/repositories/homepage_repository.dart';

class HomepageRepositoryImpl extends HomepageRepository {
  final LocalDataSource localDataSource;

  HomepageRepositoryImpl({required this.localDataSource});

  @override
  List<ProductivityLogModel> getProductivityLogsLocal() {
    return localDataSource.retrieveData();
  }
}
