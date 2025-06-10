import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';

import 'version.dart';

FutureOr create(List<String> args) async {
  String project = args[1];

  print('Creating $project...');
  print('');

  Process.runSync('dart', ['create', project]);

  print('  .gitignore');
  print('  analysis_options.yaml');
  print('  pubspec.yaml');
  print('  CHANGELOG.md');
  print('  README.md');
  print('  bin${separator}main.dart');
  print('  lib${separator}main.dart');
  print('');
  print('');

  String directory = absolute(project);
  File pubspec = File('$directory/pubspec.yaml');

  if (pubspec.existsSync()) {
    pubspec.writeAsStringSync('''
name: $project
description: A simple Oryn application.
version: 1.0.0
publish_to: none

environment:
  sdk: '>=2.14.0 <4.0.0'

dependencies:
  oryn: ^$version

dev_dependencies:
  lints: ^1.0.0''');
  }

  File env = File('$directory/.env');

  if (!env.existsSync()) {
    env.createSync();
  }

  env.writeAsStringSync('''
ENV = development
PORT = 3000''');

  File gitignore = File('$directory/.gitignore');

  if (!gitignore.existsSync()) {
    gitignore.createSync();
  }

  gitignore.writeAsStringSync('''

# Environment variables
.env''', mode: FileMode.append);

  Directory('$directory/lib').createSync();
  Directory('$directory/public').createSync();

  File('$directory/public/favicon.ico').createSync();
  File main = File('$directory/lib/main.dart');

  main.createSync();
  main.writeAsStringSync('''
import 'package:oryn/oryn.dart';

void main() async {
  final app = App();
  final port = env('PORT') ?? 3000;

  app.use(logger());
  app.use(static('public'));

  app.get('/', (Req req, Res res) async {
    await res.send('Hello from Oryn');
  });

  await app.listen(port);
  
  print('Server running at http://\${app.host}:\${app.port}');
  app.checkRoutes();
}''');

  File bin = File('$directory/bin/main.dart');

  bin.createSync();
  bin.writeAsStringSync('''
import 'package:$project/main.dart' as $project;

void main() {
  $project.main();
}''');

  File proj = File('$directory/bin/$project.dart');
  proj.deleteSync();

  print('Running pub get on $directory');

  Process.runSync(
    'cd $project & pub get',
    [],
    runInShell: true,
  );

  Process.runSync(
    'cd $project && git init && git add . && git commit -m "Initial commit"',
    [],
    runInShell: true,
  );

  print('');
  print(
    'Project $project is ready. Run this command to get started.',
  );
  print('');
  print('    cd $project');
  print('    oryn run');
}
