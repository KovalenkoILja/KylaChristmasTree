import 'application/application.dart';

void main(List<String> arguments) {
  var app = arguments.isNotEmpty
      ? Application.fromArguments(arguments)
      : Application();

  app.run();
}
