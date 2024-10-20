import ags/widget.{type Widget}

pub type Window

pub type Config {
  Config(
    monitor: Int,
    name: String,
    anchor: #(String, String, String),
    exclusivity: String,
    child: Widget,
  )
}

pub fn default() -> Config {
  Config(0, "name", #("top", "left", "right"), "exclusive", widget.None)
}

@external(javascript, "../../widget.ffi.mjs", "window")
pub fn new(config: Config) -> Window
