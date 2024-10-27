import 'package:flutter/cupertino.dart';

class TicTacToeProvider with ChangeNotifier {
  var list = ['', '', '', '', '', '', '', '', ''];
  bool isPlayer1 = true;
  String winnerPlayer = '';

  void turn(int index) {
    if (isPlayer1 && list[index] == '') {
      list[index] = 'X';
      isPlayer1 = !isPlayer1;
    } else if (!isPlayer1 && list[index] == '') {
      list[index] = 'O';
      isPlayer1 = !isPlayer1;
    }
    notifyListeners();
  }

  String? check() {
    for (int i = 0; i < 9; i += 3) {
      if (list[i] != '' && list[i] == list[i + 1] && list[i] == list[i + 2]) {
        return list[i];
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (list[i] != '' && list[i] == list[i + 3] && list[i] == list[i + 6]) {
        return list[i];
      }
    }
    if (list[0] != '' && list[0] == list[4] && list[0] == list[8]) {
      return list[0];
    }
    if (list[2] != '' && list[2] == list[4] && list[2] == list[6]) {
      return list[2];
    }
    return null;
  }

  void win() {
    var isWin = check();
    if (isWin == null) {
      return;
    } else if (isWin == 'X') {
      winnerPlayer = 'Player1';
      notifyListeners();
    } else {
      winnerPlayer = 'Player2';
      notifyListeners();
    }
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      list[i] = '';
    }
    isPlayer1 = true;
    notifyListeners();
  }
}
