import 'package:retroflux/data/models/productivity_log_model.dart';

abstract class HomepageRepository {
  List<ProductivityLogModel> getProductivityLogsLocal();
}
