import 'dart:io';

import 'package:args/command_runner.dart';
import 'dart:async';

import 'watchdog/runner.dart';
import 'watchdog/watchdog.dart';


class ServerCommand extends Command{
  @override
  final name = 'dev';

  @override
  final description = 'Run a development server';

  @override
  void run(){
    runServer();
  }

  Future runServer() async {

      try{
        
        String file = 'main.dart' ;
       
        Process? proc;
        bool inProcess = false;

        watch(Directory.current.path).listen((event) {

          if (proc!=null) {
            proc?.exitCode.then((code) async {
              if (inProcess) return;
              inProcess = true;
              print('\n\x1B[34m[  watchdog  ]\x1B[0m finished process: $code');
              Timer(Duration(seconds: 2), () async {
                print("\n\x1B[34m[  watchdog  ]\x1B[0m restarting");
                proc = await runCmd(file);
                inProcess = false;
              });

              
            });
            
            proc?.kill();

              
            
          }
        });

        if(await File("${Directory.current.path}/main.dart").exists()){
          proc = await runCmd(file);

          ProcessSignal.sigint.watch().listen((data) async {
            print('\n\x1B[31m[  watchdog stopped ]\x1B[0m');
            proc?.exitCode.then((code) => exit(0));
            proc?.kill();
          });
        }else{
          print('Error : file "main.dart" not found on ${Directory.current.path}');
          exit(1);
        }
        
      }on Exception catch(e){
        print(e);
        exit(1);
      }
  }
}



