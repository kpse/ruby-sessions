require File.dirname(__FILE__) + '/../src/game'


describe Game do
  context "ticks" do
    it "should create next tick" do 
      g = Game.new [['o']]
      g.next.should_not === g
    end
  end
  
  context "print out" do
    it "should print out empty map" do
          g = Game.new [['o']]
          g.print.should == "o\r\n"
        end
    it "should print out more lines map" do
      g = Game.new [[' ', 'o'], ['o', ' '] ]
      g.print.should == " o\r\no \r\n"
    end
    
    it "should print out with line breaker" do
      g = Game.new [[' ', 'o'], ['o', ' '] ]
      g.print('||').should == " o||\r\no ||\r\n"
    end
    
  end
  
  context "rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    it "should die while no cell around" do
      g = Game.new [['o']]
      g.next.print.should == " \r\n"
    end
    
    it "should die while 1 cell around" do
      g = Game.new [['o', 'o']]
      g.next.print.should == "  \r\n"
    end
    
    it "should live while 2 cell around" do
      g = Game.new [['o', 'o', 'o']]
      g.next.print.should == " o \r\n"
    end
    
    it "should live while 2 cell up and down" do
      g = Game.new [['o'], ['o'], ['o']]
      g.next.print.should == " \r\no\r\n \r\n"
    end
    
    it "should live while 2 cell up-left and down-right" do
      g = Game.new [['o', ' ', ' '], [' ', 'o', ' '], [' ', ' ', 'o']]
      g.next.should be_alive 1,1
    end
    
    it "should not reproduction while 2 cell around" do
      g = Game.new [['o', ' ', 'o']]
      g.next.print.should == "   \r\n"
    end
  end
  
  context "rule 2: Any live cell with two or three live neighbours lives on to the next generation." do
    it "should live while 3 cell around" do
      g = Game.new [['o', ' '], ['o', 'o'], ['o', ' ']]
      g.next.should be_alive 1,0
    end
  end
  
  context "rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding." do
    it "should die while 4 cell around" do
      g = Game.new [['o', 'o'], ['o', 'o'], ['o', ' ']]
      g.next.should_not be_alive 0, 1
    end
  end  
  
  context "rule 4: Any live cell with more than three live neighbours dies, as if by overcrowding." do
    it "should die while 4 cell around" do
      g = Game.new [['o', 'o'], ['o', 'o'], ['o', ' ']]
      g.next.should_not be_alive 0, 1
    end
  end
end