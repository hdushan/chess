require 'spec_helper'
require 'chessBoard'
require 'bishop'
require 'knight'

describe Bishop do
  describe '#initilialize' do
    let(:bishop) {Bishop.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should be inactive when created' do
      expect(bishop.active?).to be false
    end
    
    it 'should be active when successfuly placed' do
      chessboard.place(bishop, "A1")
      expect(bishop.active?).to be true
    end
    
    it 'should remain inactive if placing was not sucessful' do
      knight = Knight.new("W")
      chessboard.place(knight, "A1")
      expect {chessboard.place(bishop, "A1")}.to raise_error(NotEmptyError)
      expect(bishop.active?).to be false
      expect(knight.active?).to be true
    end
    
    it 'should become inactive when killed' do
      chessboard.place(bishop, "A1")
      expect(bishop.active?).to be true
      chessboard.killPiece(bishop)
      expect(bishop.active?).to be false
    end
    
  end
  
  describe '#right_up_cells' do
    let(:bishop) {Bishop.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should return right up cells when in middle of board' do
      chessboard.place(bishop, "E5")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("F6", "G7", "H8")
    end

    it 'should return right up cells when in middle of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("w")
      chessboard.place(knight, "G7")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("F6")
    end
    
    it 'should return right up cells when in middle of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("B")
      chessboard.place(knight, "G7")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("F6", "G7")
    end
    
    it 'should return right up cells when in middle of board if there is a same colored piece on the way in the next spot' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("w")
      chessboard.place(knight, "F6")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly()
    end
    
    it 'should return right up cells when in middle of board if there is a different colored piece on the way in the next spot' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("B")
      chessboard.place(knight, "F6")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("F6")
    end

    it 'should return right up cells when in left bottom corner of board' do
      chessboard.place(bishop, "A1")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("B2", "C3", "D4", "E5", "F6", "G7", "H8")
    end

    it 'should return right up cells when in left bottom corner of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "A1")
      knight = Knight.new("w")
      chessboard.place(knight, "E5")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("B2", "C3", "D4")
    end
    
    it 'should return right up cells when in left bottom corner of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "A1")
      knight = Knight.new("B")
      chessboard.place(knight, "E5")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly("B2", "C3", "D4", "E5")
    end

    it 'should return right up cells when in left top corner of board' do
      chessboard.place(bishop, "A8")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly()
    end

    it 'should return right up cells when in right bottom corner of board' do
      chessboard.place(bishop, "H1")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly()
    end

    it 'should return right up cells when in right top corner of board' do
      chessboard.place(bishop, "H8")
      expect(bishop.right_up_cells(chessboard)).to contain_exactly()
    end
  end
  
  describe '#right_down_cells' do
    let(:bishop) {Bishop.new("w")}
    let(:chessboard) {ChessBoard.new}

    it 'should return right down cells when in middle of board' do
      chessboard.place(bishop, "E5")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly("F4", "G3", "H2")
    end

    it 'should return right down cells when in middle of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("w")
      chessboard.place(knight, "H2")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly("F4", "G3")
    end
    
    it 'should return right down cells when in middle of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("B")
      chessboard.place(knight, "H2")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly("F4", "G3", "H2")
    end

    it 'should return right down cells when in left bottom corner of board' do
      chessboard.place(bishop, "A1")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly()
    end

    it 'should return right down cells when in left top corner of board' do
      chessboard.place(bishop, "A8")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly("B7", "C6", "D5", "E4", "F3", "G2", "H1")
    end

    it 'should return right down cells when in left top corner of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "A8")
      knight = Knight.new("w")
      chessboard.place(knight, "E4")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly("B7", "C6", "D5")
    end
    
    it 'should return right down cells when in left top corner of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "A8")
      knight = Knight.new("B")
      chessboard.place(knight, "E4")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly("B7", "C6", "D5", "E4")
    end

    it 'should return right down cells when in right bottom corner of board' do
      chessboard.place(bishop, "H1")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly()
    end

    it 'should return right down cells when in right top corner of board' do
      chessboard.place(bishop, "H8")
      expect(bishop.right_down_cells(chessboard)).to contain_exactly()
    end
  end

  describe '#left_up_cells' do
    let(:bishop) {Bishop.new("w")}
    let(:chessboard) {ChessBoard.new}

    it 'should return left up cells when in middle of board' do
      chessboard.place(bishop, "E5")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly("D6", "C7", "B8")
    end

    it 'should return left up cells when in middle of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("w")
      chessboard.place(knight, "C7")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly("D6")
    end
    
    it 'should return left up cells when in middle of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("B")
      chessboard.place(knight, "C7")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly("D6", "C7")
    end

    it 'should return left up cells when in left bottom corner of board' do
      chessboard.place(bishop, "A1")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly()
    end

    it 'should return left up cells when in left top corner of board' do
      chessboard.place(bishop, "A8")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly()
    end

    it 'should return left up cells when in right bottom corner of board' do
      chessboard.place(bishop, "H1")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly("G2", "F3", "E4", "D5", "C6", "B7", "A8")
    end

    it 'should return left up cells when in right bottom corner of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "H1")
      knight = Knight.new("w")
      chessboard.place(knight, "E4")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly("G2", "F3")
    end
    
    it 'should return left up cells when in right bottom corner of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "H1")
      knight = Knight.new("B")
      chessboard.place(knight, "E4")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly("G2", "F3", "E4")
    end

    it 'should return left up cells when in right top corner of board' do
      chessboard.place(bishop, "H8")
      expect(bishop.left_up_cells(chessboard)).to contain_exactly()
    end
  end

  describe '#left_down_cells' do
    let(:bishop) {Bishop.new("w")}
    let(:chessboard) {ChessBoard.new}

    it 'should return left down cells when in middle of board' do
      chessboard.place(bishop, "E5")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly("D4", "C3", "B2", "A1")
    end

    it 'should return left down cells when in middle of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("w")
      chessboard.place(knight, "A1")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly("D4", "C3", "B2")
    end
    
    it 'should return left down cells when in middle of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "E5")
      knight = Knight.new("B")
      chessboard.place(knight, "A1")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly("D4", "C3", "B2", "A1")
    end

    it 'should return left down cells when in left bottom corner of board' do
      chessboard.place(bishop, "A1")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly()
    end

    it 'should return left down cells when in left top corner of board' do
      chessboard.place(bishop, "A8")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly()
    end

    it 'should return left down cells when in right bottom corner of board' do
      chessboard.place(bishop, "H1")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly()
    end

    it 'should return left down cells when in right top corner of board' do
      chessboard.place(bishop, "H8")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly("G7", "F6", "E5", "D4", "C3", "B2", "A1")
    end

    it 'should return left down cells when in right top corner of board if there is a same colored piece on the way' do
      chessboard.place(bishop, "H8")
      knight = Knight.new("w")
      chessboard.place(knight, "F6")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly("G7")
    end
    
    it 'should return left down cells when in right top corner of board if there is a different colored piece on the way' do
      chessboard.place(bishop, "H8")
      knight = Knight.new("B")
      chessboard.place(knight, "F6")
      expect(bishop.left_down_cells(chessboard)).to contain_exactly("G7", "F6")
    end

  end
  
  describe '#legalMoves' do
    let(:bishop) {Bishop.new("w")}
    let(:chessboard) {ChessBoard.new}

    it 'should return legal cells when in middle of board with no other pieces on the board' do
      chessboard.place(bishop, "E5")
      expect(bishop.legalMoves(chessboard)).to contain_exactly("A1", "B2", "C3", "D4", "F6", 
                                                               "G7", "H8", "D6", "C7", "B8", 
                                                               "F4", "G3", "H2")
    end
    
    it 'should return legal cells when in middle of board surrounded by same colured pieces on the board' do
      chessboard.place(bishop, "E5")
      chessboard.place(Knight.new("W"), "F6")
      chessboard.place(Knight.new("W"), "F4")
      chessboard.place(Knight.new("W"), "D6")
      chessboard.place(Knight.new("W"), "D4")
      expect(bishop.legalMoves(chessboard)).to contain_exactly()
    end
    
    it 'should return legal cells when in middle of board surrounded by different colured pieces on the board' do
      chessboard.place(bishop, "E5")
      chessboard.place(Knight.new("B"), "F6")
      chessboard.place(Knight.new("B"), "F4")
      chessboard.place(Knight.new("B"), "D6")
      chessboard.place(Knight.new("B"), "D4")
      expect(bishop.legalMoves(chessboard)).to contain_exactly("F6", "F4", "D6", "D4")
    end
  end
  
  
end