import 'dart:convert';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:logger/logger.dart';

class SimpleLogPrinter {
  final _logger = Logger();

  SimpleLogPrinter() {
    Logger.level = devMode == "dev" ? Level.verbose : Level.debug;
  }

  debug(dynamic msg) {
    String data = JsonEncoder().convert(msg);
    _logger.d(data);
  }

  warn(dynamic msg) {
    String data = JsonEncoder().convert(msg);
    _logger.w(data);
  }

  info(dynamic msg) {
    String data = JsonEncoder().convert(msg);
    _logger.i(data);
  }

  verbose(dynamic msg) {
    String data = JsonEncoder().convert(msg);
    _logger.v(data);
  }

  error(dynamic msg) {
    String data = JsonEncoder().convert(msg);
    _logger.e(data);
  }
}

final logger = SimpleLogPrinter();
