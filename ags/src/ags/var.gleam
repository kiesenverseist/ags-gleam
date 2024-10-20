pub type Source(a) {
  Shell(String)
  Source(fn() -> a)
  Update(fn(a) -> a)
  Collect(fn(String, a) -> a)
}

pub type Variable(a)

pub type Binding(a)

pub fn poll(init: a, interval: Int, src: Source(a)) -> Variable(a) {
  case src {
    Shell(arg) -> variable(init, Poll(#(interval, arg)))
    Source(arg) -> variable(init, Poll(#(interval, arg)))
    Collect(arg) -> variable(init, Poll(#(interval, arg)))
    Update(arg) -> variable(init, Poll(#(interval, arg)))
  }
}

pub fn listen(init: a, src: Source(a)) -> Variable(a) {
  case src {
    Shell(arg) -> variable(init, Listen(arg))
    Source(arg) -> variable(init, Listen(arg))
    Collect(arg) -> variable(init, Listen(arg))
    Update(arg) -> variable(init, Listen(arg))
  }
}

pub fn static(initial: a) -> Variable(a) {
  variable(initial, Listen(""))
}

@external(javascript, "../variable.ffi.mjs", "bind")
pub fn bind(var: Variable(a)) -> Binding(a)

type Option(a) {
  Poll(poll: #(Int, a))
  Listen(listen: a)
}

@external(javascript, "../variable.ffi.mjs", "variable")
fn variable(value: a, option: Option(b)) -> Variable(c)
