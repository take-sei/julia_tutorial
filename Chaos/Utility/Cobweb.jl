module Cobweb

export render

  _rendering(x, f) = [[x,x],[x,f(x)]], [[x,f(x)],[f(x),f(x)]], f(x)
  _initial_rendering(x, f) = [[x,x],[x,f(x)]], [[0,f(x)],[f(x),f(x)]], f(x)

  function render(x_0, f, N=1000)
    """
    cobweb(x_0, f, N=1000) -> [x, y]

    When you use this with Plots,
    Do not forget to assign "" in the label property

    ex. 
    x, y = cobweb(x_0, f)
    plot!(x, y, label="")
    """
    x, y, v = _initial_rendering(x_0, f)
    for i=2:N
      _x, _y, v = _rendering(v, f)
      append!(x, _x)
      append!(y, _y)
    end
    return [x, y]
  end
end
