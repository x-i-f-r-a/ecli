import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class CreateProj extends Command{
  @override
  final name = 'create';

  @override
  final description = 'Create a new web app project using Endeavor framework';

  @override
  void run(){
    createFiles(argResults?.arguments[0]);
  }

  FutureOr createFiles(projectName) async{

  var indexHtml = 
"""
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>#title</title>
    <style>
      body {
        margin: 0;
      }

      svg {
        width: 100%;
      }
      .center {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
      }
      
      a {
        color: #2bbaff;
      }

      center {
        color: #737373;
      }
    </style>
  </head>
  <body>
    <svg viewbox="0 0 1440 320" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <style type="text/css">
          .wave {
            animation: wave 8s linear infinite;
          }

          .wave1 {
            animation: wave1 10s linear infinite;
          }

          .wave2 {
            animation: wave2 12s linear infinite;
          }

          @keyframes wave {
            0% {
              transform: translateX(0%);
            }

            100% {
              transform: translateX(100%);
            }
          }

          @keyframes wave1 {
            0% {
              transform: scaleY(1.2) translateX(0%);
            }

            100% {
              transform: scaleY(1.2) translateX(100%);
            }
          }

          @keyframes wave2 {
            0% {
              transform: scaleY(0.8) translateX(0%);
            }

            100% {
              transform: scaleY(0.8) translateX(100%);
            }
          }
        </style>
        <path
          id="sineWave"
          fill="#0099ff"
          fill-opacity="0.2"
          d="M0,160 C320,300,420,300,740,160 C1060,20,1120,20,1440,160 V0 H0"
        />
      </defs>
      <use class="wave" href="#sineWave" />
      <use class="wave" x="-100%" href="#sineWave" />
      <use class="wave1" href="#sineWave" />
      <use class="wave1" x="-100%" href="#sineWave" />
      <use class="wave2" href="#sineWave" />
      <use class="wave2" x="-100%" href="#sineWave" />
    </svg>
    <br />
    <img
      src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANHRFWHRDb21tZW50AHhyOmQ6REFGSkc0Uzk1UHM6MTAsajozMjgxMTY2NDk1MCx0OjIyMDgxMzE0PIruYgAAIiZJREFUeJzs1aFNRAEQRdHZhQQqQGAIikaoA0sHNAI1EJpatUETMIgVH4FCw+aHm3PcjHrubpZlWQYA+Ne2aw8AAH5P0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQASBA0AEgQNABIEDQIe7tMPP6ufYK4NhO1x4AHMf7YeZxN/Oy/75vL2YebmYuz9fdBRzHZlmWZe0RwN963s887WY+Dj//Z9uZu6uZ++uZ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YLR7CO+xIGgVsYogGLZkMU3h5XlO8Lc3fPALOoQ8vs7cbmdeftnXF0czm/OZy+Xf3AUcnqBD0P3zzN3T7qXsT1dnM9er3Q92oEPQIep9v68/7Pf1i5OZm/XM6fH/3gUchqBD3NvnzMfXzFLIIU3QASDAV2YACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAIEHQACBB0AAgQdAAI+AZsCwYhVMna8gAAAABJRU5ErkJggg=="
      class="center"
      height="300px"
      width="300px"
    />
    <center>Endeavor is up and running!!</center>
    <br />
    <footer>
      <center>
        <a href="https://x-i-f-r-a.github.io/Endeavor-docs/">Docs</a>
      </center>
    </footer>
  </body>
</html>
<! Thanks to https://codepen.io/pushkar8723 for the wave ––>






""";
  var content = 
"""
import 'app/$projectName.dart';

void main() async {


  final app = App();

  app.main();
}

  """;

var app = 
'''
// Using 'server' in app.runServer() is not mandatory. 
// But you have to add 'server' in app.runServer() if you are clustering your app using isolator.


import 'package:endeavor/endeavor.dart';
import '../Controllers/Home.dart';

class App{
  void main({server}) async {

  var app = Endeavor();

  app.GET('/', RootController().Home);

  // You can remove 'server' from app.runServer() if you are not clustering app into multiple isolates.

  await app.runServer(server: server);
}
}
''';
  var homeController = 
"""
import 'dart:async';
import 'package:endeavor/endeavor.dart';


class RootController{


  FutureOr Home(Request req, Response res) async {

    res.Template('index.html', {'title': 'My Endeavor App'});
    
  }
}


  
  """;


  var dockerfile = '''

FROM google/dart

WORKDIR  ${Directory.current.path}
COPY bin .
COPY pubspec.yaml .

RUN pub get
ADD . /app
RUN pub get --offline

CMD []
ENTRYPOINT ["/usr/bin/dart", "main.dart"]
  
  ''';

  var pubspecyaml = 

  """
name: $projectName
description: A simple high performance Endeavor web application.
version: 1.0.0
homepage: https://www.$projectName.com

environment:
  sdk: '>=2.17.5 <3.0.0'

dependencies:
  path: ^1.8.0
  args: ^2.3.1
  endeavor: any

  
  """;



var isolator = 
"""
// Do not delete this generated file.
// This code is generated for the clustering of your app using isolates.

import 'dart:io';
import 'package:args/args.dart';
import 'dart:isolate';
import 'app/$projectName.dart';

void main(List<String> args){

    var parser = new ArgParser()
      ..addOption('address', abbr: 'a', defaultsTo: '127.0.0.1')
      ..addOption('port', abbr: 'p', defaultsTo: '4545')
      ..addOption('isolate', abbr: 'i', defaultsTo: '2');
    var arguments = parser.parse(args);

    _startMomenter(List args)async{
      var server = await HttpServer.bind(arguments['address'],  int.parse(arguments['port']), shared: true);
      final app = App();
      app.main(server: server);
   }

    var nbOfIsolates = int.parse(arguments['isolate']);
    for (int i = 0; i < nbOfIsolates; i++) {
      Isolate.spawn(_startMomenter, [i]);
    }

    print('Print CTRL-C to shutdown!');
    stdin.readByteSync();


}



""";

  print('\x1B[34mECTL 0.1.13\x1B[0\n');

  File('${Directory.current.path}/$projectName/main.dart').create(recursive: true).then((value) {
    File file = value;
    file.writeAsString(content);
    print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/app/main.dart created');
  }).then((value) {
    File('${Directory.current.path}/$projectName/Controllers/Home.dart').create(recursive: true).then((value) {
      File file = value;
      file.writeAsString(homeController);
      print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/Controllers/Home.dart created!');
    }).then((value) {
      File('${Directory.current.path}/$projectName/docker/Dockerfile').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(dockerfile);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/docker/Dockerfile created!');
    }).then((value) {
      File('${Directory.current.path}/$projectName/isolator.dart').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(isolator);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/isolator.dart created!');
    }).then((value) {
      File('${Directory.current.path}/$projectName/templates/index.html').create(recursive: true).then((value) {
      File file = value;
      file.writeAsString(indexHtml);
      print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/templates/index.html created!');
       
    }).then((value) {
      File('${Directory.current.path}/$projectName/pubspec.yaml').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(pubspecyaml);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/pubspec.yaml created!');
      
      
      }).then((value) {
        File('${Directory.current.path}/$projectName/app/$projectName.dart').create(recursive: true).then((value) {
        File file = value;
        file.writeAsString(app);
        print('\n\x1B[34m[ * ]\x1B[0m==> ${Directory.current.path}/$projectName/app/$projectName.dart created!');
      
      
      }).then((value) {
        print('\n\n\x1B[34m[ * ]\x1B[0m Project created!');
        print('\n\x1B[34m[ * ]\x1B[0m    cd $projectName');
        print('\n\x1B[34m[ * ]\x1B[0m    ectl dev\n');
      }).then((value) async {
       
        var result = await Process.run('dart', ['pub','get','--directory=${Directory.current.path}/$projectName/']);
        
        if(result.stderr.toString() != ''){
          stdout.write(result.stderr);
          stdout.write('\nNote: Run "dart pub get" on project directory if any error occurs while running ');
        }else{
          stdout.write(result.stdout);
        }
      
      });
      });
    });
    });
     
    });
    });
  });
}

}

