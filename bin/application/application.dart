import 'package:args/args.dart';

import '../const.dart';
import 'christmas_tree.dart';

class Application {
  ArgParser _parser;

  int _height;
  bool _color;
  bool _decoration;

  Application() {
    _height = Const.DEFAULT_SIZE;
    _color = Const.DEFAULT_COLOR;
    _decoration = Const.DEFAULT_DECO;
  }

  Application.fromArguments(List<String> arguments) {
    print('arguments: ${arguments}');

    _setupParser();

    _parseArguments(arguments);

    /*print('_height: ${_height}');
    print('_color: ${_color}');
    print('_decoration: ${_decoration}');*/
  }

  void _parseArguments(List<String> arguments) {
    try {
      var parsedArgs = _parser.parse(arguments);

      /*print('parsedArgs.SIZE_ARG: ${parsedArgs[Const.SIZE_ARG]}');
      print('parsedArgs.COLOR_ARG: ${parsedArgs[Const.COLOR_ARG]}');
      print('parsedArgs.DECO_ARG: ${parsedArgs[Const.DECO_ARG]}');*/

      if (parsedArgs.wasParsed(Const.SIZE_ARG)) {
        _height = int.tryParse(parsedArgs[Const.SIZE_ARG].toString());

        if (_height > Const.MAX_SIZE) {
          _height = Const.MAX_SIZE;
        } else if (_height < Const.MIN_SIZE) {
          _height = Const.MIN_SIZE;
        }
      }
      if (parsedArgs.wasParsed(Const.COLOR_ARG)) {
        _color = parsedArgs[Const.COLOR_ARG].toString().toLowerCase() == 'true';
      }
      if (parsedArgs.wasParsed(Const.DECO_ARG)) {
        _decoration =
            parsedArgs[Const.DECO_ARG].toString().toLowerCase() == 'true';
      }
    } catch (e) {
      print(e);

      _height = Const.DEFAULT_SIZE;
      _color = Const.DEFAULT_COLOR;
      _decoration = Const.DEFAULT_DECO;
    }
  }

  void _setupParser() {
    _parser = ArgParser();
    _parser.addOption(Const.SIZE_ARG);
    _parser.addOption(Const.COLOR_ARG);
    _parser.addOption(Const.DECO_ARG);
  }

  void run() {
    var tree = ChristmasTree(_height, _color, _decoration);
    tree.GenerateTree();
  }
}
