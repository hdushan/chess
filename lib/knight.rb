require 'chessPiece'
require 'chessBoard'

class Knight < ChessPiece
  def initialize(color)
    super(color.upcase, ChessPiece.allowedTypes[:Knight])
  end
  
  def legalMoves(board)
    [right_up_cell(board), right_down_cell(board), up_right_cell(board), up_left_cell(board),\
      left_up_cell(board), left_down_cell(board), down_right_cell(board), down_left_cell(board)].compact.uniq
  end
  
  def getCell(board, file, rank)
    if (file!=nil) and (rank!=nil)
      if board.getPieceAtCell(file.to_sym, rank.to_i)==nil
        postionStringFromCoords(file, rank)
      else
        postionStringFromCoords(file, rank) if board.getPieceAtCell(file.to_sym, rank.to_i).color != self.color
      end
    else
      nil
    end
  end
  
  def horizontal_L(board, files, ranks)
    file = files[2]
    rank = ranks[1]
    getCell(board, file, rank)
  end
  
  def vertical_L(board, files, ranks)
    file = files[1]
    rank = ranks[2]
    getCell(board, file, rank)
  end
  
  def right_up_cell(board)
    files = *self.file.to_s..board.files.last
    ranks = *self.rank..board.ranks.last
    horizontal_L(board, files, ranks)
  end
  
  def right_down_cell(board)
    files = *self.file.to_s..board.files.last
    ranks = *board.ranks.first..self.rank
    ranks.reverse!
    horizontal_L(board, files, ranks)
  end
  
  def up_right_cell(board)
    files = *self.file.to_s..board.files.last
    ranks = *self.rank..board.ranks.last
    vertical_L(board, files, ranks)
  end
  
  def up_left_cell(board)
    files = *board.files.first..self.file.to_s
    ranks = *self.rank..board.ranks.last
    files.reverse!
    vertical_L(board, files, ranks)
  end
  
  def left_up_cell(board)
    files = *board.files.first..self.file.to_s
    ranks = *self.rank..board.ranks.last
    files.reverse!
    horizontal_L(board, files, ranks)
  end
  
  def left_down_cell(board)
    files = *board.files.first..self.file.to_s
    ranks = *board.ranks.first..self.rank
    files.reverse!
    ranks.reverse!
    horizontal_L(board, files, ranks)
  end
  
  def down_right_cell(board)
    files = *self.file.to_s..board.files.last
    ranks = *board.ranks.first..self.rank
    ranks.reverse!
    vertical_L(board, files, ranks)
  end
  
  def down_left_cell(board)
    files = *board.files.first..self.file.to_s
    ranks = *board.ranks.first..self.rank
    files.reverse!
    ranks.reverse!
    vertical_L(board, files, ranks)
  end
  
end