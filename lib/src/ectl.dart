
// ignore: depend_on_referenced_packages
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import 'build_app.dart';
import 'cmd_runner.dart';
import 'create_proj.dart';
import 'isolate_server.dart';
import 'show_version.dart';



void main(List<String> arguments) async {

final runner = CommandRunner('ectl', 'Create and manage web applications using Endeavor web framework')
  ..addCommand(ServerCommand())
  ..addCommand(CreateProj())
  ..addCommand(BuildApp())
  ..addCommand(GetV())
  ..addCommand(IsolateServer());

  
await runner.run(arguments);

}

