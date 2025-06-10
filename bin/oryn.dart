import 'package:oryn_cli/oryn.dart';

main(List<String> args) async {
  print('');
  print('Oryn-Cli $lversion');
  print('Oryn $version');
  print('');

  if (args.isNotEmpty) {
    if (args.first == 'run') {
      return await run(args);
    } else if (args.first == 'create' && args.length > 1) {
      return await create(args);
    } else if (args.first == 'build') {
      return await build(args);
    } else if (args.first == 'c' && args.length > 1) {
      return await controller(args);
    } else if (args.first == 'r' && args.length > 1) {
      return await repository(args);
    } else if (args.first == 'm' && args.length > 1) {
      return await middleware(args);
    } else if (args.first == 'db') {
      return await db(args);
    }
  }

  _error();
}

void _error() {
  print('Please use a correct command, such as:');
  print('');
  print('    oryn run');
  print('');
  print('    oryn create <project>');
  print('');
  print('    oryn c <controller>');
  print('');
  print('    oryn r <repository>');
  print('');
}
