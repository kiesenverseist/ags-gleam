import ags/widget/window.{type Window}

pub type Config {
  Config(
    windows: List(Window),
    style: String,
    icons: String,
    gtk_theme: String,
    icon_theme: String,
  )
}

pub fn default() -> Config {
  Config([], "", "", "", "")
}

@external(javascript, "../app.ffi.mjs", "config")
pub fn config(config: Config) -> Nil
