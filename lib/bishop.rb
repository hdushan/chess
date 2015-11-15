require 'chessPiece'
require 'chessBoard'

class Bishop < ChessPiece
  def initialize(color)
    super(color.upcase, ChessPiece.allowedTypes[:Bishop])
  end
  
  def legalMoves(board)
    (right_up_cells(board) + right_down_cells(board) + left_up_cells(board) + left_down_cells(board)).uniq
  end
  
  def getCells(board, files, ranks)
    cells = []
    while true do
      file = files.shift
      rank = ranks.shift
      if postionStringFromCoords(file, rank) != self.positionString
        break if file==nil or rank==nil
        if board.getPieceAtCell(file.to_sym, rank.to_i)==nil
          cells.push(postionStringFromCoords(file, rank))
        else
          cells.push(postionStringFromCoords(file, rank)) if board.getPieceAtCell(file.to_sym, rank.to_i).color != self.color
          break
        end
      end
    end
    return cells
  end
  
  def right_up_cells(board)
    files = *self.file.to_s..board.files.last
    ranks = *self.rank..board.ranks.last
    getCells(board, files, ranks)
  end
  
  def right_down_cells(board)
    files = *self.file.to_s..board.files.last
    ranks = *board.ranks.first..self.rank
    ranks.reverse!
    getCells(board, files, ranks)
  end
  
  def left_up_cells(board)
    files = *board.files.first..self.file.to_s
    ranks = *self.rank..board.ranks.last
    files.reverse!
    getCells(board, files, ranks)
  end
  
  def left_down_cells(board)
    files = *board.files.first..self.file.to_s
    ranks = *board.ranks.first..self.rank
    files.reverse!
    ranks.reverse!
    getCells(board, files, ranks)
  end

end