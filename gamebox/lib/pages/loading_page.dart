import 'package:flutter/material.dart';
import 'home_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(flex: 3),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/games.png'),
              ),
            ),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                textStyle: TextStyle(fontSize: 16),
                shadowColor: Colors.transparent,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF779BEE), Color(0xFFF7539C)],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                child: Text(
                  "Let's Play",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                children: [
                  // SizedBox(height: 5),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/powered_by.png'),
                  ),
                  // SizedBox(height: 5),
                  Text(
                    '© 2024 GameBox',
                    style: TextStyle(color: Color(0xFF474747), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
