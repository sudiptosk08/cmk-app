import 'package:fl_chart/fl_chart.dart';
//import 'package:fl_line_chart_example/widget/line_titles.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {

  const LineChartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 200,
    height: 80,
    child: LineChart(
          LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 3,
          titlesData: FlTitlesData(
            show: false,
          ),  
            gridData: FlGridData(
              show: false,

              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 0,
                );
              },
              drawVerticalLine: false,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 2,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
              border: Border.all(color: const Color(0xff37434d), width: 0),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                const  FlSpot(0, 0.5),
                const  FlSpot(1, 1.2),
                const  FlSpot(3, 0.8),
                const  FlSpot(4.8, 2.5),
                const  FlSpot(7.8, 1.6),
                const  FlSpot(8.5, 2.4),
                const FlSpot(9.1, 2.6),
                const FlSpot(9.3,2.8),
                
                ],
              
                isCurved: true,
                barWidth: 1.5,
                colors: [const Color(0xFF5A0AC9)],
                dotData: FlDotData(show: false),
               
              ),
            ],
          ),
        ),
  );
}