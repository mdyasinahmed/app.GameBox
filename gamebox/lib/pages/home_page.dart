import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 50), // Space from the top
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 220, // Adjusted width
                height: 100, // Adjusted height
                child: Image.asset('assets/home_logo.png'),
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Select Game & Enjoy!",
              style: TextStyle(
                fontSize: 24, // Adjusted font size
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Color(0xFF474747), Color(0xFF474747)],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),
            SizedBox(height: 10), // Adjusted spacing
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 1, // Adjusted aspect ratio
                padding: EdgeInsets.all(10), // Adjusted padding
                children: [
                  _buildGameTile(context, 'Tic-Tac-Toe', 'assets/games_images/tic_tac_toe.png', [Color(0xFFFA00FF), Color(0xFF8F9AFF)]),
                  _buildGameTile(context, 'Memory Game', 'assets/games_images/memory_game.png', [Color(0xFFFF3D8E), Color(0xFFFF77D9)]),
                  _buildGameTile(context, 'Brick Breaker', 'assets/games_images/brick_breaker.png', [Color(0xFF8DD881), Color(0xFF0A870F)]),
                  _buildGameTile(context, 'Puzzle Game', 'assets/games_images/puzzle_game.png', [Color(0xFF7E94CD), Color(0xFF3F4A67)]),
                  _buildGameTile(context, 'Simon Says', 'assets/games_images/simon_says.png', [Color(0xFF4A65FF), Color(0xFF0DB0FF)]),
                  _buildGameTile(context, 'Catch the Ball', 'assets/games_images/catch_the_ball.png', [Color(0xFFFDC830), Color(0xFFF37335)]),
                ],
              ),
            ),
            SizedBox(height: 10), // Space before the powered by image
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 80, // Adjusted width
                height: 40, // Adjusted height
                child: Image.asset('assets/powered_by.png'),
              ),
            ),
            SizedBox(height: 10), // Space from the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildGameTile(BuildContext context, String title, String imagePath, List<Color> colors) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective game page here
        // Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(title)));
      },
      child: Container(
        margin: EdgeInsets.all(5.0), // Adjusted margin
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80, // Adjusted width
              height: 80, // Adjusted height
              child: Image.asset(imagePath),
            ),
            SizedBox(height: 20), // Adjusted spacing
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18, // Adjusted font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
