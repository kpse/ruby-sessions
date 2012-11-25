require File.dirname(__FILE__) + '/cell'
class Game
  ALIVE = 'o'
  DEAD = ' '
  def initialize input
    @map = input
  end
  
  def print breaker=''
    @map.inject(""){|out, line| out << line.join << "#{breaker}\r\n"}
  end

  def next
    Game.new rule.call(@map)
  end
  
  def alive? x, y
    return false if out_of_boundary?(x, y)
    @map[y][x] == ALIVE
  end
  
  private
  
  def out_of_boundary?(x, y)
    x < 0 || y < 0 || @map.size <= y || @map[y].size <= x
  end
  
  def alive_neighbours_count x, y
    Cell.new(x, y).neighbours.count {|pos| alive? pos.x, pos.y}
  end
  
  def rule
    Proc.new do|map| 
      map.each_with_index.map do |line, y| 
        line.each_with_index.map do |cell, x| 
          case alive_neighbours_count(x, y) 
            when 2
              alive?(x, y) ? ALIVE : DEAD
            when 3
              ALIVE
          else
            DEAD
          end
        end 
      end
    end
  end
end


  