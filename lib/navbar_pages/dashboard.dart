import 'package:ev_homes_crm_v7/navbar_pages/tagging_form.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'enquiry_form.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Dashboard'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    _buildLabelBox('100', 'Leads'),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildLabelBox('50', 'Approved'),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildLabelBox('25', 'Rejected'),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildLabelBox('25', 'Pending'),
                  ]),

                  // Set an appropriate height
                  // LabelsDemo(),
                  const SizedBox(
                    height: 20,
                  ),
                  const LineChartDemo(),

                  const SizedBox(
                    height: 20,
                  ),
                  const PieChartDemo(),
                  const SizedBox(
                    height: 20,
                  ),
                  const FunnelChartDemo(),
                  const SizedBox(
                    height: 180,
                  ),
                ],
              ),
            ),
          ),
          if (_isMenuVisible) ...[
            Positioned(
              bottom: 170.0, // Position above the FAB
              right: 16.0,
              child: AnimatedOpacity(
                opacity: _isMenuVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  onPressed: () {
                    // Navigate to the Client Tagging Form page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientTaggingForm()),
                    );
                  },
                  child: const Text(
                    'Client Tagging Form',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 220.0, // Position above the Client Tagging Form button
              right: 16.0,
              child: AnimatedOpacity(
                opacity: _isMenuVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  onPressed: () {
                    // Navigate to the Enquiry Form page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnquiryForm()),
                    );
                  },
                  child: const Text(
                    'Enquiry Form',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
          Positioned(
            bottom: 100.0,
            right: 20.0,
            child: FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              elevation: 10,
              onPressed: _toggleMenu,
              tooltip: 'Add',
              child: const Icon(
                FluentIcons.add_24_regular,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelBox(String quantity, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              quantity,
              style: const TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 16, 18, 19),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10.0,
                color: Color.fromARGB(255, 87, 99, 108),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelsDemo extends StatelessWidget {
  const LabelsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
          child: Text(
            'Below is a summary of your day.',
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Manrope',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 8.0),
                  child: Container(
                    width: 130.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFFE0E3E7),
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '16',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'New Activity',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
                  child: Container(
                    width: 130.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFFE0E3E7),
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '16',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Manrope',
                                      color: Colors.deepPurpleAccent,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Current Tasks',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 8.0),
                  child: Container(
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFFE0E3E7),
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '16',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Manrope',
                                      color: Colors.teal,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Completed Tasks',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LineChartDemo extends StatelessWidget {
  const LineChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0.5, color: Colors.black26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Leads',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButton<String>(
                value: 'Weekly',
                items: <String>['Weekly', 'Monthly', 'Yearly']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Line Chart
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 250,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) {
                          return const Text('10');
                        } else if (value == 500) {
                          return const Text('20');
                        } else if (value == 1000) {
                          return const Text('30');
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Sun');
                        case 1:
                          return const Text('Mon');
                        case 2:
                          return const Text('Tue');
                        case 3:
                          return const Text('Wed');
                        case 4:
                          return const Text('Thu');
                        case 5:
                          return const Text('Fri');
                        case 6:
                          return const Text('Sat');
                      }
                      return const Text('');
                    },
                  )),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 1000,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 50),
                      const FlSpot(1, 150),
                      const FlSpot(2, 250),
                      const FlSpot(3, 500),
                      const FlSpot(4, 700),
                      const FlSpot(5, 350),
                      const FlSpot(6, 450),
                    ],
                    isCurved: true,
                    color: Colors.deepPurpleAccent,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: true,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.deepPurpleAccent.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PieChartDemo extends StatelessWidget {
  const PieChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: Colors.black26)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Tagging Status',
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'Manrope',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 60),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150,
                child: PieChart(
                  PieChartData(
                    sections: showingSections(),
                    startDegreeOffset: 20,
                    centerSpaceRadius: 60,
                    sectionsSpace: 0,
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total balance',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\$3.250,00',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LegendItem(color: Color(0xff7d5ded), text: 'Approved'),
              LegendItem(color: Colors.orangeAccent, text: 'Pending'),
              LegendItem(color: Colors.redAccent, text: 'Rejected'),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.redAccent,
        value: 47,
        title: '47%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      ),
      PieChartSectionData(
        color: const Color(0xff7d5ded),
        value: 23,
        title: '23%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      ),
      PieChartSectionData(
        color: Colors.orangeAccent,
        value: 20,
        title: '20%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      ),
    ];
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }
}

class FunnelChartDemo extends StatelessWidget {
  const FunnelChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0.5, color: Colors.black26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Leads Statistics',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButton<String>(
                value: "Last Week",
                icon: const Icon(Icons.arrow_drop_down),
                items: <String>["Last Week", "Last Month", "Last Year"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: FunnelStage(
                      label: "Total", value: "200", percentage: "100%")),
              Expanded(
                  child: FunnelStage(
                      label: "Approved", value: "160", percentage: "80%")),
              Expanded(
                  child: FunnelStage(
                      label: "Pipelined", value: "100", percentage: "50%")),
              Expanded(
                  child: FunnelStage(
                      label: "Site visited", value: "40", percentage: "20%")),
              Expanded(
                  child: FunnelStage(
                      label: "Booked", value: "20", percentage: "10%")),
            ],
          ),
        ],
      ),
    );
  }
}

class FunnelStage extends StatelessWidget {
  final String label;
  final String value;
  final String percentage;

  const FunnelStage({
    super.key,
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          percentage,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        FunnelSegment(percentage: double.parse(percentage.replaceAll("%", ""))),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class FunnelSegment extends StatelessWidget {
  final double percentage;

  const FunnelSegment({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(60, 100 * (percentage / 100)), // height based on percentage
      painter: FunnelPainter(),
    );
  }
}

class FunnelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Colors.deepPurpleAccent,
          Colors.deepPurple,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width * 0.25, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
