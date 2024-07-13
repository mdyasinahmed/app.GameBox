import 'package:flutter/material.dart';
// import 'home_page.dart';

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
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage()),
                // );
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
                    colors: [Color(0xFFA11818), Color(0xFFFF5F5F)],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                child: Text(
                  "Let's Play",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text(
                    'POWERED BY',
                    style: TextStyle(color: Color(0xFF474747), fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  SizedBox(height: 5),  // Reduced the height here
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: Image.asset('assets/organisation_logo.png'),
                  ),
                  SizedBox(height: 10),
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
