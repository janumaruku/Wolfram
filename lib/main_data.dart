import 'package:flutter/cupertino.dart';

class MainData extends ChangeNotifier {
  int _line = 20;
  int _start = 0;
  int _window = 80;
  int _move = 0;
  int _rule = 30;

  int get line => _line;
  int get start => _start;
  int get window => _window;
  int get move => _move;
  int get rule => _rule;

  void setRule(String rule) {
    _rule = int.parse(rule);
    notifyListeners();
  }

  void setLine(String line) {
    _line = int.parse(line);
    notifyListeners();
  }

  void setStart(String start) {
    _start = int.parse(start);
    notifyListeners();
  }

  void setWindow(String window) {
    _window = int.parse(window);
    notifyListeners();
  }

  void setMove(String move) {
    _move = int.parse(move);
    notifyListeners();
  }
}