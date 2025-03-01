import 'package:flutter/material.dart';

void main() {
  runApp(LanguageApp());
}

class LanguageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }+-
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String currentLevel = "Beginner";
  final List<String> difficultyLevels = ["Beginner", "Intermediate", "Advanced"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomCurveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              color: Colors.orangeAccent,
            ),
          ),
          Positioned(
            top: 70,
            left: -50,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            right: -80,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                        Spacer(),
                        Text("Curse", style: TextStyle(color: Colors.white, fontSize: 20)),
                        Spacer(),
                        Icon(Icons.more_vert, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Text(
                        "Spanish",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 40,
                            width: 130,
                            padding: EdgeInsets.only(left: 15),
                            child: PopupMenuButton<String>(
                              onSelected: (String choice) {
                                setState(() {
                                  currentLevel = choice;
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return difficultyLevels.map((String level) {
                                  return PopupMenuItem<String>(
                                    value: level,
                                    child: Text(level),
                                  );
                                }).toList();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    currentLevel,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.keyboard_arrow_down, color: Colors.orange, size: 30),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: CircularProgressIndicator(
                                      value: 0.43,
                                      backgroundColor: Colors.white.withOpacity(0.3),
                                      valueColor: AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text("43%", style: TextStyle(color: Colors.white, fontSize: 30)),
                                      Text("Complete", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Icon(Icons.diamond, color: Colors.red, size: 30),
                          Icon(Icons.diamond, color: Colors.red, size: 30),
                          SizedBox(width: 5),
                          Text("2 Milestones", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      Item("Basics", Icons.sticky_note_2, 4, 5, Colors.orange),
                      Item("Occupations", Icons.work, 1, 5, Colors.red),
                      Item("Conversation", Icons.chat, 3, 5, Colors.blue),
                      Item("Places", Icons.place, 1, 5, Colors.green),
                      Item("Family", Icons.groups, 3, 5, Colors.purple),
                      Item("Food", Icons.fastfood, 2, 5, Colors.blueAccent),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Item(String title, IconData icon, int progress, int total, Color color) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // Shadow color
                    blurRadius: 6, // Softness of the shadow
                    spreadRadius: 2, // Spread of the shadow
                    offset: Offset(2, 2), // Shadow position
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(icon, color: color, size: 35),
              ),
            ),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text("$progress / $total"),
            LinearProgressIndicator(
              value: progress / total,
              color: color,
              backgroundColor: color.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height - 180)
      ..quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 180)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
