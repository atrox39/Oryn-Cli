# Oryn Cli 

Simple Command Line Interface (CLI) for [Oryn](https://pub.dev/packages/oryn) framework.

## Installation

You may activate Oryn CLI by using the following command in your terminal:

```bash
pub global activate oryn_cli
```

## Usage 

### Create New Project

To create a new Lucifer project, you may use the following Oryn command.

```bash
oryn create <project>
```

For example, you may use `oryn create` command like so:

```bash
oryn create blog
```

It will create a new Lucifer project named blog in the `blog` directory.

### Run Project (With Hot Reload)

To run your project, you may use the following command in the root project directory:

```bash
oryn run
```

### Build Executable 

To compile your app and build an executable, you may use:

```bash
oryn build
```

It will generate the executable file, ready to be sent to production server, in your root project directory.

### Generate Controller

To generate a controller in your Oryn project, you may use:

```bash
oryn c <controller>
```

For example, you may use `oryn c` command like so:

```bash
oryn c user
```

It will create a `user_controller.dart` file with class `UserController` in the `lib/controller` directory.

### Generate Repository

To generate a repository in your Lucifer project, you may use:

```bash
oryn r <repository>
```

For example, you may use `oryn r` command like so:

```bash
oryn r user
```

It will create a `user_repository.dart` file with class `UserRepository` in the `lib/repository` directory.

### Create Custom Middleware 

You may use the following command to generate a new custom middleware for your Lucifer project:

```bash
oryn m <middleware>
```

For example, you may use `oryn m` command like so:

```bash
oryn m auth
```

It will create a `auth.dart` file containing an `auth` function to define your custom middleware in the `lib/middleware` directory.