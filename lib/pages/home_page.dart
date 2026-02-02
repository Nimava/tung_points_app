import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/point.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TungPoint> allPoints = [];
  List<TungPoint> filteredPoints = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPoints();
  }

  Future<void> loadPoints() async {
    final data = await DefaultAssetBundle.of(context).loadString('assets/tung_points.json');
    final List<dynamic> jsonResult = json.decode(data);
    setState(() {
      allPoints = jsonResult.map((e) => TungPoint.fromJson(e)).toList();
      filteredPoints = allPoints;
    });
  }

  void searchPoints(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPoints = allPoints;
      } else {
        final lower = query.toLowerCase();
        filteredPoints = allPoints.where((p) {
          return p.name.toLowerCase().contains(lower) ||
              p.primaryIndications.toLowerCase().contains(lower) ||
              p.secondaryIndications.toLowerCase().contains(lower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tung Points")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              onChanged: searchPoints,
              decoration: InputDecoration(
                hintText: 'Search by indication or point name...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          searchPoints('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: filteredPoints.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
                    itemCount: filteredPoints.length,
                    itemBuilder: (context, index) {
                      final p = filteredPoints[index];
                      return Card(
                        child: ListTile(
                          title: Text(p.name),
                          subtitle: Text(
                            p.primaryIndications,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => Navigator.pushNamed(context, '/point', arguments: p),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
