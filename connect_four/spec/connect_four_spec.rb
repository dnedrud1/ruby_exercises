require_relative '../connect_four'

describe ConnectFour do

  let(:connect_four) { ConnectFour.new }
  let(:new_board) { [[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]] }
  let(:used_board) { [["ϴ","Ϯ","ϴ","ϴ",4,5,"Ϯ"],["ϴ","ϴ","ϴ","Ϯ",4,5,"ϴ"],["Ϯ","Ϯ","Ϯ",3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]] }
  
  describe '#start' do
    it 'starts with an empty board' do
      expect(connect_four.board).to eql new_board
    end
  end
  
  describe '#place_piece' do
    it 'places piece correctly on empty board' do
      connect_four.place_piece("ϴ",3)
      test_board = new_board
      test_board[0][2] = "ϴ"
      expect(connect_four.board).to eql test_board
    end
    it 'places piece correctly on used board' do
      connect_four.board = used_board
      connect_four.place_piece("ϴ",3)
      test_board = [["ϴ","Ϯ","ϴ","ϴ",4,5,"Ϯ"],["ϴ","ϴ","ϴ","Ϯ",4,5,"ϴ"],["Ϯ","Ϯ","Ϯ",3,4,5,6],[0,1,"ϴ",3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]]
      expect(connect_four.board).to eql test_board
    end
  end
  
  describe "#display_board" do
    it 'displays empty board correctly' do
      empty_display = "1 2 3 4 5 6 7\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _"
      expect(connect_four.display).to eql empty_display
    end
    it 'displays used board correctly' do
      connect_four.board = used_board
      used_display = "1 2 3 4 5 6 7\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\nϮ Ϯ Ϯ _ _ _ _\nϴ ϴ ϴ Ϯ _ _ ϴ\nϴ Ϯ ϴ ϴ _ _ Ϯ"
      expect(connect_four.display).to eql used_display
    end
  end
  
  describe 'victory conditions' do
    it 'displays victory for four in a column' do
      connect_four.board = [[0,1,2,"ϴ",4,5,6],[0,1,2,"ϴ",4,5,6],[0,1,2,"ϴ",4,5,6],[0,1,2,"ϴ",4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]]
      expect(connect_four.victory?("ϴ")).to be_truthy
    end
    it 'displays victory for four in a row' do
      connect_four.board = [[0,1,2,3,4,5,6],[0,"ϴ","ϴ","ϴ","ϴ",5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]]
      expect(connect_four.victory?("ϴ")).to be_truthy
    end
    it 'displays victory for four diagonal' do
      connect_four.board = [[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,"ϴ",2,3,4,5,6],[0,1,"ϴ",3,4,5,6],[0,1,2,"ϴ",4,5,6],[0,1,2,3,"ϴ",5,6]]
      expect(connect_four.victory?("ϴ")).to be_truthy
    end
    it 'doesnt display victory when pieces not in a row' do
      connect_four.board = [[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6]]
      expect(connect_four.victory?("ϴ")).to be_falsey
    end
  end
  
  describe 'player input' do
    it 'accepts a valid number' do
      allow(connect_four).to receive(:gets) { "1" }
      connect_four.player_move("ϴ")
      expect(connect_four.board[0]).to eql ["ϴ",1,2,3,4,5,6]
    end
    it 'doesnt accept a number for a full column' do
      connect_four.board = [["Ϯ",1,2,3,4,5,6],["ϴ",1,2,3,4,5,6],["Ϯ",1,2,3,4,5,6],["ϴ",1,2,3,4,5,6],["Ϯ",1,2,3,4,5,6],["ϴ",1,2,3,4,5,6]]
      allow(connect_four).to receive(:gets) { "1" }
      expect(connect_four).to receive(:puts).with("Please enter a valid number!")
      connect_four.player_move("Ϯ")
    end
    it 'doesnt accept an invalid number' do
      allow(connect_four).to receive(:gets) { "10" }
      expect(connect_four).to receive(:puts).with("Please enter a valid number!")
      connect_four.player_move("ϴ")
    end
    it 'doesnt accept letters' do
      allow(connect_four).to receive(:gets) { "hello" }
      expect(connect_four).to receive(:puts).with("Please enter a valid number!")
      connect_four.player_move("ϴ")
    end
    it 'doesnt accept blank input' do
      allow(connect_four).to receive(:gets) { "" }
      expect(connect_four).to receive(:puts).with("Please enter a valid number!")
      connect_four.player_move("ϴ")
    end
    it 'moves the moves_count up' do
      allow(connect_four).to receive(:gets) { "1" }
      connect_four.player_move("ϴ")
      expect(connect_four.moves_count).to eql 1
    end
  end
  
  describe '#tie?' do
    it 'recognizes when a game is tied' do
      connect_four.board = [["Ϯ","Ϯ","ϴ","Ϯ","Ϯ","ϴ","ϴ"],["Ϯ","ϴ","Ϯ","ϴ","Ϯ","Ϯ","Ϯ"],["ϴ","Ϯ","Ϯ","Ϯ","ϴ","Ϯ","ϴ"],["ϴ","Ϯ","ϴ","Ϯ","ϴ","Ϯ","ϴ"],["Ϯ","ϴ","Ϯ","ϴ","ϴ","ϴ","Ϯ"],["ϴ","Ϯ","ϴ","ϴ","Ϯ","ϴ","ϴ"]]
      expect(connect_four.tie?).to be_truthy
    end
    it 'doesnt call a tie if one has not been achieved' do
      connect_four.board = used_board
      expect(connect_four.tie?).to be_falsey
    end
  end
  
end
