const time = Variable("", {
  poll: [
    1000,
    function () {
      return Date().toString();
    },
  ],
});

export function window(config) {
  return Widget.Window(config);
}

export function _window(config) {
  return Widget.Window({
    ...config,
    //monitor: 0,
    //name: `bar0`,
    //anchor: ["top", "left", "right"],
    //exclusivity: "exclusive",
    child: Widget.CenterBox({
      //start_widget: config.child.start_widget,
      start_widget: Widget.Label({
        hpack: "center",
        label: "Welcome to AGS!",
      }),
      end_widget: Widget.Label({
        hpack: "center",
        label: time.bind(),
      }),
    }),
  });
}

export function center_box(config) {
  return Widget.CenterBox(config);
}

export function label(config) {
  return Widget.Label(config);
}
