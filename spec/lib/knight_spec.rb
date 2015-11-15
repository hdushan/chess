require 'spec_helper'
require 'chessBoard'
require 'bishop'
require 'knight'

describe Knight do
  describe '#initilialize' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should be inactive when created' do
      expect(knight.active?).to be false
    end
    
    it 'should be active when successfuly placed' do
      chessboard.place(knight, "A1")
      expect(knight.active?).to be true
    end
    
    it 'should remain inactive if placing was not sucessful' do
      bishop = Bishop.new("W")
      chessboard.place(bishop, "A1")
      expect {chessboard.place(knight, "A1")}.to raise_error(NotEmptyError)
      expect(knight.active?).to be false
      expect(bishop.active?).to be true
    end
    
    it 'should become inactive when killed' do
      chessboard.place(knight, "A1")
      expect(knight.active?).to be true
      chessboard.killPiece(knight)
      expect(knight.active?).to be false
    end
    
  end
  
  describe '#right_up_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return right up cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.right_up_cell(chessboard)).to eq "G6"
    end
    
    it 'should return right up cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "G6")
      expect(knight.right_up_cell(chessboard)).to be nil
    end
    
    it 'should return right up cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "G6")
      expect(knight.right_up_cell(chessboard)).to eq "G6"
    end
    
    it 'should return right up cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.right_up_cell(chessboard)).to eq "C2"
    end
    
    it 'should return right up cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.right_up_cell(chessboard)).to be nil
    end
    
    it 'should return right up cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.right_up_cell(chessboard)).to be nil
    end
    
    it 'should return right up cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.right_up_cell(chessboard)).to be nil
    end
  end
  
  describe '#right_down_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return right down cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.right_down_cell(chessboard)).to eq "G4"
    end
    
    it 'should return right down cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "G4")
      expect(knight.right_down_cell(chessboard)).to be nil
    end
    
    it 'should return right down cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "G4")
      expect(knight.right_down_cell(chessboard)).to eq "G4"
    end
    
    it 'should return right down cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.right_down_cell(chessboard)).to be nil
    end
    
    it 'should return right down cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.right_down_cell(chessboard)).to be nil
    end
    
    it 'should return right down cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.right_down_cell(chessboard)).to eq "C7"
    end
    
    it 'should return right down cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.right_down_cell(chessboard)).to be nil
    end
  end
  
  describe '#up_right_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return up right cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.up_right_cell(chessboard)).to eq "F7"
    end
    
    it 'should return up right cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "F7")
      expect(knight.up_right_cell(chessboard)).to be nil
    end
    
    it 'should return up right cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "F7")
      expect(knight.up_right_cell(chessboard)).to eq "F7"
    end
    
    it 'should return up right cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.up_right_cell(chessboard)).to eq "B3"
    end
    
    it 'should return up right cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.up_right_cell(chessboard)).to be nil
    end
    
    it 'should return up right cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.up_right_cell(chessboard)).to be nil
    end
    
    it 'should return up right cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.up_right_cell(chessboard)).to be nil
    end
  end
  
  describe '#up_left_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return up left cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.up_left_cell(chessboard)).to eq "D7"
    end
    
    it 'should return up left cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "D7")
      expect(knight.up_left_cell(chessboard)).to be nil
    end
    
    it 'should return up left cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "D7")
      expect(knight.up_left_cell(chessboard)).to eq "D7"
    end
    
    it 'should return up left cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.up_left_cell(chessboard)).to be nil
    end
    
    it 'should return up left cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.up_left_cell(chessboard)).to eq "G3"
    end
    
    it 'should return up left cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.up_left_cell(chessboard)).to be nil
    end
    
    it 'should return up left cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.up_left_cell(chessboard)).to be nil
    end
  end
  
  describe '#left_up_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return left up cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.left_up_cell(chessboard)).to eq "C6"
    end
    
    it 'should return left up cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "C6")
      expect(knight.left_up_cell(chessboard)).to be nil
    end
    
    it 'should return left up cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "C6")
      expect(knight.left_up_cell(chessboard)).to eq "C6"
    end
    
    it 'should return left up cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.left_up_cell(chessboard)).to be nil
    end
    
    it 'should return left up cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.left_up_cell(chessboard)).to eq "F2"
    end
    
    it 'should return left up cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.left_up_cell(chessboard)).to be nil
    end
    
    it 'should return left up cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.left_up_cell(chessboard)).to be nil
    end
  end
  
  describe '#left_down_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return left down cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.left_down_cell(chessboard)).to eq "C4"
    end
    
    it 'should return left down cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "C4")
      expect(knight.left_down_cell(chessboard)).to be nil
    end
    
    it 'should return left down cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "C4")
      expect(knight.left_down_cell(chessboard)).to eq "C4"
    end
    
    it 'should return left down cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.left_down_cell(chessboard)).to be nil
    end
    
    it 'should return left down cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.left_down_cell(chessboard)).to be nil
    end
    
    it 'should return left down cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.left_down_cell(chessboard)).to be nil
    end
    
    it 'should return left down cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.left_down_cell(chessboard)).to eq "F7"
    end
  end
  
  describe '#down_right_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return down right cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.down_right_cell(chessboard)).to eq "F3"
    end
    
    it 'should return down right cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "F3")
      expect(knight.down_right_cell(chessboard)).to be nil
    end
    
    it 'should return down right cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "F3")
      expect(knight.down_right_cell(chessboard)).to eq "F3"
    end
    
    it 'should return down right cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.down_right_cell(chessboard)).to be nil
    end
    
    it 'should return down right cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.down_right_cell(chessboard)).to be nil
    end
    
    it 'should return down right cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.down_right_cell(chessboard)).to eq "B6"
    end
    
    it 'should return down right cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.down_right_cell(chessboard)).to be nil
    end
  end
  
  describe '#down_left_cell' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return down left cell when in middle of board' do
      chessboard.place(knight, "E5")
      expect(knight.down_left_cell(chessboard)).to eq "D3"
    end
    
    it 'should return down left cell when in middle of board if there is a same colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("w")
      chessboard.place(bishop, "D3")
      expect(knight.down_left_cell(chessboard)).to be nil
    end
    
    it 'should return down left cell when in middle of board if there is a different colored piece in the cell' do
      chessboard.place(knight, "E5")
      bishop = Bishop.new("B")
      chessboard.place(bishop, "D3")
      expect(knight.down_left_cell(chessboard)).to eq "D3"
    end
    
    it 'should return down left cell when in bottom left corner' do
      chessboard.place(knight, "A1")
      expect(knight.down_left_cell(chessboard)).to be nil
    end
    
    it 'should return down left cell when in bottom right corner' do
      chessboard.place(knight, "H1")
      expect(knight.down_left_cell(chessboard)).to be nil
    end
    
    it 'should return down left cell when in top left corner' do
      chessboard.place(knight, "A8")
      expect(knight.down_left_cell(chessboard)).to be nil
    end
    
    it 'should return down left cell when in top right corner' do
      chessboard.place(knight, "H8")
      expect(knight.down_left_cell(chessboard)).to eq "G6"
    end
  end
  
  describe '#legalMoves' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return right cells in the example mentioned in the exercise' do
      chessboard.place(knight, "D5")
      expect(knight.legalMoves(chessboard)).to contain_exactly("B4", "B6", "C3", "C7", "E3", "E7", "F4", "F6")
    end

    it 'should return legal cells when in middle of board with no other pieces on the board' do
      chessboard.place(knight, "E5")
      expect(knight.legalMoves(chessboard)).to contain_exactly("F7", "D7", "G6", "G4",\
                                                                "F3", "D3", "C4", "C6")
    end
    
    it 'should return legal cells when in middle of board surrounded by same colured pieces on the board' do
      chessboard.place(knight, "E5")
      chessboard.place(Bishop.new("W"), "F7")
      chessboard.place(Bishop.new("W"), "D7")
      chessboard.place(Bishop.new("W"), "G6")
      chessboard.place(Bishop.new("W"), "G4")
      chessboard.place(Bishop.new("W"), "F3")
      chessboard.place(Bishop.new("W"), "D3")
      chessboard.place(Bishop.new("W"), "C4")
      chessboard.place(Bishop.new("W"), "C6")
      expect(knight.legalMoves(chessboard)).to contain_exactly()
    end
    
    it 'should return legal cells when in middle of board surrounded by different colured pieces on the board' do
      chessboard.place(knight, "E5")
      chessboard.place(Bishop.new("B"), "F7")
      chessboard.place(Bishop.new("B"), "D7")
      chessboard.place(Bishop.new("B"), "G6")
      chessboard.place(Bishop.new("B"), "G4")
      chessboard.place(Bishop.new("B"), "F3")
      chessboard.place(Bishop.new("B"), "D3")
      chessboard.place(Bishop.new("B"), "C4")
      chessboard.place(Bishop.new("B"), "C6")
      expect(knight.legalMoves(chessboard)).to contain_exactly("F7", "D7", "G6", "G4",\
                                                                "F3", "D3", "C4", "C6")
    end
  end
  
  describe '#positionString' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return position as a string' do
      chessboard.place(knight, "E5")
      expect(knight.positionString).to eq "E5"
    end
  end
end