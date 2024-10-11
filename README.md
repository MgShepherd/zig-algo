## Zig Algo

This project is a collection of different algorithms programmed in Zig. This is my first project in the Zig language and so am using this to help with learning a lot of the Zig language features, hence some of the algorithms may not be implemented in the most optimal way (although still should be quite efficient).

This is a library which can be imported into your projects.

## Building the Project

This project uses the `build.zig` to manage its build. To build the project use the command:
```
zig build --summary all
```

## Testing the Project

To run all of the unit tests which ship with this project, use the command:
```
zig build test
```

## Running the Demo

As part of the library, there is a demo executable which can be used to see some of the library features and also see how to add into your own project.

To build the demo, you need to run the build command with the arguement `--Denable-demo`:
```
zig build --summary all --Denable-demo
```

Once built, the executable can be run using:
```
./zig-out/bin/demo
```
