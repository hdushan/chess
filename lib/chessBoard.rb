class NotEmptyError < Exception
end

class InvalidPositionError < Exception
end

class ChessBoard
  
  @RANKINDEXSTART = 1
    
  def initialize
    @board = {
      :A=>Array.new(8,nil),
      :B=>Array.new(8,nil),
      :C=>Array.new(8,nil),
      :D=>Array.new(8,nil),
      :E=>Array.new(8,nil),
      :F=>Array.new(8,nil),
      :G=>Array.new(8,nil),
      :H=>Array.new(8,nil)
    }    
  end
  
  def place(piece, positionString)
    file, rank = checkPosition(positionString)
    @board[file][rank-@RANKINDEXSTART] = piece
    piece.file = file
    piece.rank = rank
  end
  
  def checkPosition(positionString)
    file, rank = getPositionCoords(positionString)
    if @board[file][rank-@RANKINDEXSTART] != nil
      raise NotEmptyError
    end
    return file, rank
  end
  
  def getPositionCoords(positionString)
		parser_string = /(?<file>[ABCDEFGH]{1})(?<rank>[1-8]{1})/
		result = parser_string.match(Regexp.quote(positionString))
    if result == nil
      raise InvalidPositionError
    else
      return result['file'].to_sym, result['rank'].to_i
    end
  end
  
  def getPieceAtCell(file, rank)
    @board[file][rank-@RANKINDEXSTART]
  end
  
end