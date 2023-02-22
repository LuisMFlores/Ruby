
class TileNode

    attr_accessor :x, :y, :v, :g, :h, :f

    def initialize(x, y, v, g = 0, h = 0, w = 0)
        @x = x
        @y = y
        @v = v
        @g = g
        @h = h
        @w = w
    end

    def update(g, h)
        @g = g
        @h += h
        nil
    end

    def f
        @g + @h + @w
    end

end