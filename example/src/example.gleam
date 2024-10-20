import ags/app
import ags/var
import ags/widget/center_box
import ags/widget/label
import ags/widget/window.{type Window}
import gleam/int
import gleam/io

fn bar(monitor: Int) -> Window {
  let time = var.new(var.Poll("", 1000, var.Shell("date")))

  window.new(
    io.debug(window.Config(
      monitor:,
      name: "bar" <> int.to_string(monitor),
      anchor: #("top", "left", "right"),
      exclusivity: "exclusive",
      child: center_box.new(
        io.debug(center_box.Config(
          start_widget: label.new(label.default("welcome to ags from gleam")),
          end_widget: label.new(label.Config(
            hpack: "center",
            label: var.bind(time),
          )),
        )),
      ),
    )),
  )
}

pub fn main() {
  io.println("Hello from gleam in gtk js!")

  app.config(app.Config(..app.default(), windows: [bar(0)]))

  0
}
