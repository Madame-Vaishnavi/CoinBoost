import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class NewsTask extends StatefulWidget {
  @override
  _NewsTaskState createState() => _NewsTaskState();
}

class _NewsTaskState extends State<NewsTask> {
  late final WebViewController _controller;
  int _secondsLeft = 30; // Countdown timer
  Timer? _timer;
  bool _showPopup = false; // Flag to show/hide popup

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.bbc.com/news")); // Replace with your news link

    _startCountdown();
  }

  // Starts a countdown timer for 30 seconds
  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        _timer?.cancel(); // Stop timer
        if (mounted) {
          setState(() {
            _showPopup = true; // Show popup after 30 sec
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  "Time: $_secondsLeft sec",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            // WebView displaying the news page
            WebViewWidget(controller: _controller),

            // 3D Floating Popup appears when timer reaches 0
            if (_showPopup)
              Positioned(
                left: 20,
                right: 20,
                top: 10, // Popup appears below the AppBar
                child: Transform.scale(
                  scale: 1.05, // Slight scale for 3D effect
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFAF2),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 6), // Creates a lifted 3D effect
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_balance_wallet, color: Colors.black),
                                SizedBox(width: 8),
                                Text(
                                  "\$10.00",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showPopup = false; // Hide popup on claim
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Claim"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
