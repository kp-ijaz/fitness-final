import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserReport extends StatefulWidget {
  const UserReport({super.key});

  @override
  State<UserReport> createState() => _UserReportState();
}

class _UserReportState extends State<UserReport> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        title: const Text('REPORT'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(
          // scrollDirection: Axis.horizontal,
          children: [
            SfCartesianChart(
              primaryXAxis: CategoryAxis(
                maximumLabels: 100,
                autoScrollingDelta: 7,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
              ),
              primaryYAxis: NumericAxis(),
              title: ChartTitle(text: 'Half yearly sales analysis'),
              tooltipBehavior: _tooltipBehavior,
              zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                  enablePinching: true,
                  zoomMode: ZoomMode.xy),
              series: <ChartSeries>[
                ColumnSeries<ReportData, String>(
                  dataSource: <ReportData>[
                    ReportData('01', 15),
                    ReportData('02', 35),
                    ReportData('03', 20),
                    ReportData('04', 32),
                    ReportData('05', 40),
                    ReportData('06', 70),
                    ReportData('07', 34),
                    ReportData('08', 14),
                    ReportData('09', 35),
                    ReportData('10', 20),
                    ReportData('11', 32),
                    ReportData('12', 35),
                    ReportData('13', 20),
                    ReportData('14', 32),
                    ReportData('15', 15),
                    ReportData('16', 35),
                    ReportData('17', 20),
                    ReportData('18', 32),
                    ReportData('19', 40),
                    ReportData('20', 45),
                    ReportData('21', 34),
                    ReportData('22', 14),
                    ReportData('23', 35),
                    ReportData('24', 20),
                    ReportData('25', 32),
                    ReportData('26', 35),
                    ReportData('27', 20),
                    ReportData('28', 32),
                    ReportData('29', 20),
                    ReportData('30', 32),
                    ReportData('31', 20),
                    ReportData('32', 20),
                    ReportData('33', 32),
                  ],
                  xValueMapper: (ReportData sales, _) => sales.days,
                  yValueMapper: (ReportData sales, _) => sales.time,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true, color: Colors.amber),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReportData {
  ReportData(this.days, this.time);
  final String days;
  final double time;
}
