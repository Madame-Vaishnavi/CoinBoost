import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardPage extends StatefulWidget {
  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  final List<Map<String, dynamic>> levels = [
    {"level": "Level 01", "minWithdraw": 50, "earnings": 25},
    {"level": "Level 02", "minWithdraw": 100, "earnings": 0},
    {"level": "Level 03", "minWithdraw": 150, "earnings": 0},
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.orange,
      systemNavigationBarColor: Colors.orange,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title (Previously in AppBar)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.orange, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Rewarding Levels",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
              ),
              SizedBox(height: 16),
      
              // List of Rewarding Levels
              Expanded(
                child: ListView.builder(
                  itemCount: levels.length,
                  itemBuilder: (context, index) {
                    final level = levels[index];
                    double progress = (level['earnings'] / level['minWithdraw']).clamp(0.0, 1.0);
      
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          // Header with Level Title
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: Text(
                              level['level'],
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
      
                          // Content Section
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Minimum Withdrawal = \$${level['minWithdraw']}",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Your earnings = \$${level['earnings']}",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                SizedBox(height: 12),
      
                                // Progress Bar
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: 10,
                                    backgroundColor: Colors.orange.shade100,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(height: 4),
      
                                // Progress Percentage
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${(progress * 100).toInt()}%",
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
