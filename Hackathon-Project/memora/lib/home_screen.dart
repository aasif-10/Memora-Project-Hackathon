import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedApp = ''; // Stores selected app
  List<String> categories = [];

  final Map<String, List<String>> appCategories = {
    'Twitter': ['Tech', 'Science', 'Finance', 'Sports'],
    'YouTube': ['Coding', 'Gaming', 'Music', 'Education'],
    'GeeksforGeeks': ['DSA', 'Web Dev', 'Machine Learning'],
    'Reddit': ['Memes', 'News', 'Technology'],
  };

  void onAppSelected(String app) {
    setState(() {
      selectedApp = app;
      categories = appCategories[app] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030F34),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Handle menu action
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 8.0),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Handle search action
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Handle notifications action
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF030F34),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select an App",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Heading color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildAppButton("Twitter", () => onAppSelected('Twitter')),
                const SizedBox(height: 15),
                _buildAppButton("YouTube", () => onAppSelected('YouTube')),
                const SizedBox(height: 15),
                _buildAppButton(
                  "GeeksforGeeks",
                  () => onAppSelected('GeeksforGeeks'),
                ),
                const SizedBox(height: 15),
                _buildAppButton("Reddit", () => onAppSelected('Reddit')),
                const SizedBox(height: 30),
                if (selectedApp.isNotEmpty) ...[
                  Text(
                    "Categories for $selectedApp",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...categories.map(
                    (category) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/saved-content',
                            arguments: category,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF203061),
                          foregroundColor: Colors.white,
                          minimumSize: Size(300, 50), // Matching width
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(category, style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppButton(String text, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF203061),
        minimumSize: Size(300, 50), // Matching width
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
