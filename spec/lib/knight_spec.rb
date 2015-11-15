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
  
  describe '#positionString' do
    let(:knight) {Knight.new("w")}
    let(:chessboard) {ChessBoard.new}
    
    it 'should be inactive when created' do
      chessboard.place(knight, "E5")
      expect(knight.positionString).to eq "E5"
    end
  end
end