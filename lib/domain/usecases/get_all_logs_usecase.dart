import 'package:retroflux/core/usecase.dart';
import 'package:retroflux/data/models/productivity_log_model.dart';
import 'package:retroflux/domain/repositories/homepage_repository.dart';

class GetAllLogsUsecase extends Usecase<List<ProductivityLogModel>, NoParams> {
  final HomepageRepository repository;

  GetAllLogsUsecase({required this.repository});
  @override
  List<ProductivityLogModel>? call(NoParams params) {
    return repository.getProductivityLogsLocal();
  }
}
