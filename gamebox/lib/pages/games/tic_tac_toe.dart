import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  // Define the board size
  static const int boardSize = 3;

  // Initialize the board with empty strings
  late List<String> board;
  late String currentPlayer;
  late bool gameEnded;
  late String winner;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      board = List.generate(boardSize * boardSize, (index) => '');
      currentPlayer = 'X';
      gameEnded = false;
      winner = '';
    });
  }

  void _handleTap(int index) {
    if (board[index] == '' && !gameEnded) {
      setState(() {
        board[index] = currentPlayer;
        if (_checkWinner()) {
          gameEnded = true;
          winner = currentPlayer;
        } else if (!board.contains('')) {
          gameEnded = true;
          winner = 'Draw';
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner() {
    for (int i = 0; i < boardSize; i++) {
      if (_checkRow(i) || _checkColumn(i)) {
        return true;
      }
    }
    return _checkDiagonals();
  }

  bool _checkRow(int row) {
    int start = row * boardSize;
    return board[start] != '' &&
        board[start] == board[start + 1] &&
        board[start] == board[start + 2];
  }

  bool _checkColumn(int col) {
    return board[col] != '' &&
        board[col] == board[col + boardSize] &&
        board[col] == board[col + 2 * boardSize];
  }

  bool _checkDiagonals() {
    return (board[0] != '' &&
        board[0] == board[4] &&
        board[0] == board[8]) ||
        (board[2] != '' &&
            board[2] == board[4] &&
            board[2] == board[6]);
  }

  Widget _buildBoard() {
    return GridView.builder(
      itemCount: boardSize * boardSize,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: boardSize,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _handleTap(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF6679A5), width: 2.5),
            ),
            child: Center(
              child: Text(
                board[index],
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: board[index] == 'X' ? Color(0xFF779BEE) : Color(0xFFF7539C),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFA00FF), Color(0xFF8F9AFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (gameEnded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                winner == 'Draw' ? 'It\'s a Draw!' : 'Winner: $winner',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildBoard(),
                ),
              ),
            ),
          ),
          if (gameEnded)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _resetGame,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFF7539C),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Restart Game'),
              ),
            ),
          SizedBox(height: 10), // Space before the powered by image
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 100, // Adjusted width
              height: 80, // Adjusted height
              child: Image.asset('assets/powered_by.png'),
            ),
          ),
          SizedBox(height: 10), // S
        ],
      ),
    );
  }
}
