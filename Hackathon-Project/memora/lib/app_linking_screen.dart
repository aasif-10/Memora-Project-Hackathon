import 'package:flutter/material.dart';

class AppLinkingScreen extends StatefulWidget {
  const AppLinkingScreen({Key? key}) : super(key: key);

  @override
  _AppLinkingScreenState createState() => _AppLinkingScreenState();
}

class _AppLinkingScreenState extends State<AppLinkingScreen> {
  bool twitterLinked = false;
  bool youtubeLinked = false;
  bool gfgLinked = false;
  bool redditLinked = false;

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
            onPressed: () {},
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
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFF030F34),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns text & buttons to left
            children: [
              Text(
                "Link Your Apps",
                style: TextStyle(
                  fontSize: 24, // Slightly reduced size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              _buildLinkButton("Twitter", twitterLinked, () {
                setState(() {
                  twitterLinked = !twitterLinked;
                });
              }),
              _buildLinkButton("YouTube", youtubeLinked, () {
                setState(() {
                  youtubeLinked = !youtubeLinked;
                });
              }),
              _buildLinkButton("GeeksforGeeks", gfgLinked, () {
                setState(() {
                  gfgLinked = !gfgLinked;
                });
              }),
              _buildLinkButton("Reddit", redditLinked, () {
                setState(() {
                  redditLinked = !redditLinked;
                });
              }),

              Spacer(), // Pushes the button to the bottom

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      if (twitterLinked ||
                          youtubeLinked ||
                          gfgLinked ||
                          redditLinked) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please link at least one app.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2D6CE9),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Increased corner radius
                      ),
                    ),
                    child: Text("Continue", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLinkButton(String text, bool isLinked, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6), // Reduced spacing
      child: SizedBox(
        width: 350, // Equal width for all buttons
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF203061),
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ), // Reduced height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ), // Increased rounded corners
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.link, color: Colors.white),
              SizedBox(width: 10), // Space between icon and text
              Text(
                isLinked ? "$text Linked" : "Link $text",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
