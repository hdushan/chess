require 'chessPiece'

class Knight < ChessPiece
  def initialize(color)
    super(color, ChessPiece.allowedTypes[:Knight])
  end
  
  def legalCells(board)
    @file_step = 2
    @rank_step = 1
  end
end