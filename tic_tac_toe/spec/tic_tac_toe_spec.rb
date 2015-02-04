require_relative '../tic_tac_toe'

describe Game do

  before :each do 
    @game = Game.new
  end
  
  describe "#start" do
  
    it "begins with board set" do
      expect(@game.board).to eql [1,2,3,4,5,6,7,8,9]
    end
    
  end

  describe "victory conditions" do
    
    it "declares victory when top row is all Xs" do
      @game.board = ["X","X","X",4,5,6,7,8,9]
      expect(@game.victory("X")).to eql true
    end
    
    it "doesn't declare victory when Xs not in a row" do
      @game.board = ["X",2,"X",4,"X",6,7,8,9]
      expect(@game.victory("X")).not_to eql true
    end
    
    it "doesn't declare victory when game is a tie" do
      @game.board = ["X","O","X","O","X","O","O","X","O"]
      expect(@game.victory("X")).not_to eql true 
      expect(@game.victory("O")).not_to eql true 
    end
    
  end
  
  describe "player inputs" do
    
    it "accepts a valid number" do
      allow(@game).to receive(:gets) { "1" }
      @game.get_move("O")
      expect(@game.board).to eql ["O",2,3,4,5,6,7,8,9]
    end
  
    it "doesn't accept a number not on the board" do
      allow(@game).to receive(:gets) { "10" }
      expect(@game).to receive(:puts).with("Please enter a valid number!")
      @game.get_move("O")
    end
    
    it "doesn't accept letters" do
      allow(@game).to receive(:gets) { "hello" }
      expect(@game).to receive(:puts).with("Please enter a valid number!")
      @game.get_move("O")
    end
    
    it "doesn't accept a blank input" do
      allow(@game).to receive(:gets) { "" }
      expect(@game).to receive(:puts).with("Please enter a valid number!")
      @game.get_move("O")
    end
    
  end
  
end
