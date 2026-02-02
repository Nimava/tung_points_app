import 'package:flutter/material.dart';
import '../models/point.dart';
import 'point_detail_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class PointsPage extends StatefulWidget {
  const PointsPage({super.key});

  @override
  State<PointsPage> createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  List<TungPoint> allPoints = [];
  List<TungPoint> filteredPoints = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPoints();
  }

  Future<void> _loadPoints() async {
    final jsonString = await rootBundle.loadString('assets/tung_points.json');
    final List data = json.decode(jsonString);
    final points = data.map((e) => TungPoint.fromJson(e)).toList();
    setState(() {
      allPoints = points;
      filteredPoints = points;
      isLoading = false;
    });
  }

  void _filterPoints(String query) {
    final q = query.toLowerCase();
    setState(() {
      filteredPoints = allPoints.where((p) {
        return p.name.toLowerCase().contains(q) ||
            p.primaryIndications.toLowerCase().contains(q) ||
            p.secondaryIndications.toLowerCase().contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search by indication or point name...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _filterPoints,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredPoints.length,
                    itemBuilder: (context, index) {
                      final point = filteredPoints[index];
                      return ListTile(
                        title: Text(point.name),
                        subtitle: Text(
                          point.primaryIndications,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PointDetailPage(point: point),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
