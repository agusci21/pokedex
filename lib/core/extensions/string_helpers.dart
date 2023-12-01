import 'package:flutter_template/infrastructure/environments_confi.dart';

extension StringHelper on String {
  String? getIdFromUrl(String endpoint) {
    if (!startsWith(EnvironmentConfig.baseUrl)) {
      return null;
    }
    return replaceAll(EnvironmentConfig.baseUrl, '').replaceAll('/', '').replaceAll(endpoint, '');
  }

  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
