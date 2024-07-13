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
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                board[index],
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
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
        title: Text('Tic-Tac-Toe'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildBoard(),
            ),
          ),
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
        ],
      ),
    );
  }
}
