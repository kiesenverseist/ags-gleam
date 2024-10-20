# ags gleam bindings

This is a WIP repo that contains gleam bindings for [AGS](https://aylur.github.io/ags-docs/) .


### Running the example
Running this is a couple of steps:

```command
cd example
gleam build
```
The first time you run this, the entry file (`gleam.main.mjs`) won't exist. Create this by running:
```command
gleam run
```
This will error and hang, this is expected as this is running under a normal JS runtime. AGS and GTK injects certain variables that are required for these bindings to work.

To actually run your generated code under ags do:
```command
ags --config ./builddev/javascript/example/gleam.main.mjs
```
From now you can just `gleam build` and rerun the ags command.
