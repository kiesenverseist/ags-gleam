import ags/widget.{type Widget}

pub type Config {
  Config(start_widget: Widget, end_widget: Widget)
}

pub fn default() {
  Config(widget.None, widget.None)
}

@external(javascript, "../../widget.ffi.mjs", "center_box")
pub fn new(config: Config) -> Widget
