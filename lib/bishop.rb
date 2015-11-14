require 'chessPiece'

class Bishop < ChessPiece
  def initialize(color)
    super(color, ChessPiece.allowedTypes[:Bishop])
  end
  
  def legalCells(board)
    @file_step = 1
    @rank_step = 1
  end
end