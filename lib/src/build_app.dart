import 'dart:io';

import 'package:args/command_runner.dart';

class BuildApp extends Command{
  @override
  final name = 'build';

  @override
  final description = 'Build the app';

  @override
  void run(){
    buildapp(argResults?.arguments);
  }

  Future buildapp(appName) async {
      ProcessResult results = await Process.run('dart', ['compile', 'exe','${Directory.current.path}/main.dart' ,'-o', '${Directory.current.path}/$appName']);
      print(results.stdout);
  }
}