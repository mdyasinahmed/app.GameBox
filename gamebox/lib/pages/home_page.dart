import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 40), // Space from the top
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 250,
                height: 100,
                child: Image.asset('assets/home_logo.png'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Select Game & Enjoy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Color(0xFF779BEE), Color(0xFFF7539C)],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildGameTile(context, 'Tic-Tac-Toe', 'assets/tic_tac_toe.png', [Color(0xFF00B4DB), Color(0xFF0083B0)]),
                  _buildGameTile(context, 'Memory Game', 'assets/memory_game.png', [Color(0xFF00C9FF), Color(0xFF92FE9D)]),
                  _buildGameTile(context, 'Brick Breaker', 'assets/brick_breaker.png', [Color(0xFFFDC830), Color(0xFFF37335)]),
                  _buildGameTile(context, 'Catch the Ball', 'assets/catch_the_ball.png', [Color(0xFFFC5C7D), Color(0xFF6A82FB)]),
                  _buildGameTile(context, 'Puzzle Game', 'assets/puzzle_game.png', [Color(0xFFFC466B), Color(0xFF3F5EFB)]),
                  _buildGameTile(context, 'Simon Says', 'assets/simon_says.png', [Color(0xFFFFD200), Color(0xFFF7971E)]),
                ],
              ),
            ),
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
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(imagePath),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
