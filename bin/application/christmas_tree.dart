import 'dart:io';
import 'dart:math';

import '../const.dart';

class ChristmasTree {
  int _height;
  bool _color;
  bool _decoration;

  Random rng;

  ChristmasTree(int height, bool color, bool decoration) {
    _height = height;
    _color = color;
    _decoration = decoration;

    rng = Random();
  }

  void GenerateTree() {
    var height = _height;
    var treeWidth = height * 2;

    for (var h = 0; h < height; h++) {
      var s = '';
      var padding = s.padRight(treeWidth - h, ' ');

      stdout.write(padding);
      GenerateTreeLayer((h * 2) + 2);
    }
    AddBase(treeWidth);
  }

  void AddBase(treeWidth) {
    stdout.write(' '.padRight(treeWidth));
    _color
        ? stdout.writeln('${Const.BLACK_COL}||' '${Const.RESET_COL}')
        : stdout.writeln('||');
  }

  void GenerateTreeLayer(int layerWidth) {
    _color ? stdout.write('${Const.GREEN_COL}/') : stdout.write('/');

    for (var i = 0; i < layerWidth - 2; i++) {
      if (_decoration) {
        if (rng.nextBool()) {
          AddOrnament();
        } else {
          stdout.write(' ');
        }
      } else {
        stdout.write(' ');
      }
    }
    _color
        ? stdout.writeln('${Const.GREEN_COL}' r'\' '${Const.RESET_COL}')
        : stdout.writeln(r'\');
  }

  void AddOrnament() {
    var i = rng.nextInt(Const.DECO_CANDIDATES.length);
    var deco = Const.DECO_CANDIDATES[i];

    _color
        ? stdout.write('${Const.YELLOW_COL}$deco' '${Const.RESET_COL}')
        : stdout.write(deco);
  }
}
