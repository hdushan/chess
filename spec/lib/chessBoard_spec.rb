require 'spec_helper'
require 'chessBoard'
require 'bishop'
require 'knight'

describe 'ChessBoard' do
  
  describe '#files' do
    let(:chessBoard) {ChessBoard.new}
    it 'should return all files A-H' do
      expect(chessBoard.files).to contain_exactly(*"A".."H")
    end
  end
  
  describe '#ranks' do
    let(:chessBoard) {ChessBoard.new}
    it 'should return all ranks 0-8' do
      expect(chessBoard.ranks).to contain_exactly(*1..8)
    end
  end
  
  describe '#getPositionCoords' do
    let (:chessboard) {ChessBoard.new}
    
    it 'should return coords for valid minumum position string' do
      expect(chessboard.getPositionCoords("A1")).to contain_exactly(:A, 1)
    end
    
    it 'should return coords for valid maximum position string' do
      expect(chessboard.getPositionCoords("H8")).to contain_exactly(:H, 8)
    end
    
    it 'should throw InvalidPositionError if rank outside 1-8' do
      expect {chessboard.getPositionCoords("A0")}.to raise_error(InvalidPositionError)
    end
    
    it 'should throw InvalidPositionError if file outside A-H' do
      expect {chessboard.getPositionCoords("I8")}.to raise_error(InvalidPositionError)
    end
    
    it 'should throw InvalidPositionError if rank not specified' do
      expect {chessboard.getPositionCoords("A")}.to raise_error(InvalidPositionError)
    end
    
    it 'should throw InvalidPositionError if file not specified' do
      expect {chessboard.getPositionCoords("5")}.to raise_error(InvalidPositionError)
    end
  end
  
  describe '#killPiece' do
    let (:chessBoard) {ChessBoard.new}
    
    it 'should set piece to inactive' do
      originalPiece = Bishop.new("W")
      chessBoard.place(originalPiece, "A1")
      expect(originalPiece.active?).to be true
      chessBoard.killPiece(originalPiece)
      expect(originalPiece.active?).to be false
    end
  end
  
  describe '#clearCell' do
    let (:chessBoard) {ChessBoard.new}
    
    it 'should set set cell to nil' do
      originalPiece = Bishop.new("W")
      chessBoard.place(originalPiece, "A1")
      expect(chessBoard.getPieceAtCell(:A, 1)).to eq originalPiece
      chessBoard.clearCell(1, :A)
      expect(chessBoard.getPieceAtCell(:A, 1)).to be nil
    end
  end
  
  describe '#isCellAvailable' do
    let (:chessBoard) {ChessBoard.new}
    
    it 'should return true if cell is currently not occupied' do
      expect(chessBoard.isCellAvailable("W", 1, :A)).to be true
    end
    
    it 'should return true if cell is currently occupied by piece of another color' do
      originalPiece = Bishop.new("W")
      chessBoard.place(originalPiece, "A1")
      newPiece = Knight.new("B")
      expect(chessBoard.isCellAvailable(newPiece.color, 1, :A)).to be true
    end
    
    it 'should return false if cell is currently occupied by piece of same color' do
      originalPiece = Bishop.new("W")
      chessBoard.place(originalPiece, "A1")
      newPiece = Knight.new("W")
      expect(chessBoard.isCellAvailable(newPiece.color, 1, :A)).to be false
    end
  end
  
  describe '#place' do
    let (:chessboard) {ChessBoard.new}
    
    it 'should return true if the coordinates are currently not occupied' do
      bishop = Bishop.new("W")
      expect(chessboard.place(bishop, "A1")).to be true
      expect(bishop.file).to eq :A
      expect(bishop.rank).to be 1
    end
    
    it 'should return true if the coordinates are currently occupied by a different colored piece' do
      originalPiece = Bishop.new("W")
      chessboard.place(originalPiece, "A1")
      newPiece = Knight.new("B")
      expect {chessboard.place(newPiece, "A1")}.to_not raise_error(NotEmptyError)
      expect(originalPiece.file).to eq nil
      expect(originalPiece.rank).to be nil
      expect(chessboard.getPieceAtCell(:A, 1)).to eq newPiece
      expect(originalPiece.active?).to be false
      expect(newPiece.active?).to be true
      expect(newPiece.file).to be :A
      expect(newPiece.rank).to be 1
    end
    
    it 'should throw NotEmptyError if the coordinates are currently occupied by another similar colored piece' do
      originalPiece = Bishop.new("W")
      chessboard.place(originalPiece, "A1")
      newPiece = Knight.new("W")
      expect {chessboard.place(newPiece, "A1")}.to raise_error(NotEmptyError)
      expect(originalPiece.file).to eq :A
      expect(originalPiece.rank).to be 1
      expect(chessboard.getPieceAtCell(:A, 1)).to eq originalPiece
      expect(originalPiece.active?).to be true
      expect(newPiece.active?).to be false
      expect(newPiece.file).to be nil
      expect(newPiece.rank).to be nil
    end
  end
  
  describe '#getEmptyCells' do
    let (:chessboard) {ChessBoard.new}

    it 'should return 64 cells if board empty' do
      expect(chessboard.getEmptyCells.length).to be 64
      expect(chessboard.getEmptyCells).to include "A1"
    end
    
    it 'should return 63 cells if one piece on board' do
      bishop = Bishop.new("W")
      chessboard.place(bishop, "A1")
      expect(chessboard.getEmptyCells.length).to be 63
      expect(chessboard.getEmptyCells).to include "A2"
      expect(chessboard.getEmptyCells).to_not include "A1"
    end
  end
end