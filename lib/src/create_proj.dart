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
    center, a {
        color: #2bbaff;
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
                transform: scaleY(.8) translateX(0%);
              }
      
              100% {
                transform: scaleY(.8) translateX(100%);
              }
            }
          </style>
          <path id='sineWave' fill="#0099ff" fill-opacity="0.2" d="M0,160 C320,300,420,300,740,160 C1060,20,1120,20,1440,160 V0 H0" />
        </defs>
        <use class="wave" href="#sineWave" />
        <use class="wave" x="-100%" href="#sineWave" />
        <use class="wave1" href="#sineWave" />
        <use class="wave1" x="-100%" href="#sineWave" />
        <use class="wave2" href="#sineWave" />
        <use class="wave2" x="-100%" href="#sineWave" />
      </svg>
      <br>
      <img src="data:image/png;base64,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ADAgdAAYEDoADAgdAAaEDgADQgeAAaEDwIDQAWBA6AAwIHQAGBA6AAwIHQAGhA4AA0IHgAGhA8CA0AFgQOgAMCB0ABgQOgAMCB0ABoQOAANCB4ABoQPAgNABYEDoADAgdAAYEDoADAgdAAaEDgADQgeAAaEDwIDQAWBA6AAwIHQAGBA6AAwIHQAGhA4AA0IHgAGhA8CA0AFgQOgAMCB0ABgQOgAMCB0ABoQOAANCB4ABoQPAgNABYEDoADAgdAAYEDoADAgdAAaEDgADQgeAAaEDwIDQAWBA6AAwIHQAGBA6AAwIHQAGhA4AA0IHgAGhA8CA0AFgQOgAMCB0ABgQOgAMCB0ABoQOAANCB4ABoQPAgNABYEDoADAgdAAYEDoADAgdAAaEDgADQgeAAaEDwIDQAWBA6AAwIHQAGBA6AAwIHQAGhA4AA0IHgAGhA8CA0AFgQOgAMCB0ABgQOgAMCB0ABoQOAANCB4ABoQPAgNABYEDoADAgdAAYEDoADAgdAAaEDgADQgeAAaEDwIDQAWBA6AAwIHQAGBA6AAwIHQAGhA4AA0IHgAGhA8CA0AFgQOgAMCB0ABgQOgAMCB0ABoQOAANCB4ABoQPAgNABYEDoADAgdAAYEDoADAgdAAaEDgADQgeAAaEDwIDQAWBA6AAwIHQAGBA6AAwIHQAGhA4AA0IHgAGhA8CA0AFgQOgAMCB0ABgQOgAMCB0ABoQOAANCB4ABoQPAgNABYEDoADAgdAAYEDoADAgdAAaEDgADQgeAgQBo2/rhrGBTCAAAAABJRU5ErkJggg==" class="center" height="300px" width="300px">
      <center>
          Endeavor is up and running!!
      </center>
      <br>
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
import 'app/myApp.dart';

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

  // Kindly remove below 'server' from app.runServer() if you are not clustering app into multiple isolates.

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

    res.Template('index.html', {'title': 'My Momentum App'});
    
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
import 'app/myApp.dart';

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

  print('\x1B[34mmMCTL 0.1.4\x1B[0\n');

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
        print('\x1B[34m[ * ]\x1B[0m Project created!');
        print('\n\n\x1B[34m[ * ]\x1B[0m    cd $projectName');
        print('\n\n\x1B[34m[ * ]\x1B[0m    mctl dev\n\n');
      });
      });
    });
    });
     
    });
    });
  });
}

}

