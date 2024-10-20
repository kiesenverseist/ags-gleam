import ags/var.{type Binding}
import ags/widget.{type Widget}

pub type Config(a) {
  Config(hpack: String, label: Binding(a))
}

pub fn default(text: String) {
  Config("center", var.bind(var.static(text)))
}

@external(javascript, "../../widget.ffi.mjs", "label")
pub fn new(config: Config(a)) -> Widget
