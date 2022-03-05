import 'package:blog_minimal/core/service/data_service.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerSingleton<DataService>(DataService());
}
