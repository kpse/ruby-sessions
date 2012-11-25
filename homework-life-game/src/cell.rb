class Cell
  attr_reader :x, :y
  def initialize x, y
    @x = x
    @y = y
  end
  
  def neighbours
    [Cell.new(@x, @y - 1), Cell.new( @x, @y + 1), Cell.new( @x + 1, @y - 1), Cell.new( @x - 1, @y - 1),
      Cell.new( @x + 1, @y), Cell.new( @x - 1, @y), Cell.new( @x + 1, @y + 1), Cell.new( @x - 1, @y + 1)]
  end
end

