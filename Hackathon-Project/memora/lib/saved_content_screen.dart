import 'package:flutter/material.dart';

class SavedContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)?.settings.arguments as String? ?? "Unknown";
    List<String> savedContent = [
      "Article 1 on $category",
      "Video 2 on $category",
      "Blog 3 on $category",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030F34),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Handle menu action
          },
        ),
        title: Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Handle search action
            },
          ),
          SizedBox(width: 10), // Small spacing between icons
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications action
            },
          ),
          SizedBox(width: 10), // Spacing for balance
        ],
      ),
      backgroundColor: Color(0xFF030F34),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Saved Content for $category",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: savedContent.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300, // Matching button width
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF203061),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          savedContent[index],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showCategorySummary(context, category);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Category Summary", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCategorySummary(BuildContext context, String category) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Summary of $category"),
          content: Text("This is a placeholder summary."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
