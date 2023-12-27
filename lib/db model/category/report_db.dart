import 'package:hive_flutter/hive_flutter.dart';
import 'package:homeworkout/db%20model/report_model.dart';

const REPORT_DB_NAME = "report_db";

abstract class reportscreen {
  Future<void> addReport(Reportmodal obj);
  Future<void> getReports(Reportmodal obj);
  Future<void> getAllReports(Reportmodal obj);
}

class ReportDB implements reportscreen {
  ReportDB._internal();

  static ReportDB instance = ReportDB._internal();

  factory ReportDB() {
    return instance;
  }

  @override
  Future<void> addReport(Reportmodal obj) async {
    final reportdb = await Hive.openBox<Reportmodal>(REPORT_DB_NAME);
    await reportdb.put(obj.id!, obj);
  }

  @override
  Future<List<Reportmodal>> getAllReports(Reportmodal obj) async {
    final reportdb = await Hive.openBox<Reportmodal>(REPORT_DB_NAME);
    return reportdb.values.toList();
  }

  @override
  Future<List<Reportmodal>> getReports(Reportmodal obj) async {
    final reportdb = await Hive.openBox<Reportmodal>(REPORT_DB_NAME);
    getAllReports(obj);
    return reportdb.values.toList();
  }
}
