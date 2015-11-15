class NotEmptyError < Exception
end

class InvalidPositionError < Exception
end

class ChessBoard
    
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
    @RANKINDEXSTART = 1
  end
  
  def files
    @board.keys.map{|i|i.to_s.upcase}
  end
  
  def ranks
    [*1..@board[@board.keys.first].length]
  end
  
  def place(piece, positionString)
    file, rank = getPositionCoords(positionString)
    if isCellAvailable(piece.color, rank, file)
      killPiece(getPieceAtCell(file, rank)) if getPieceAtCell(file, rank)
      clearCell(rank, file)
      placePieceAtCell(piece, file, rank)
      return true
    else
      raise NotEmptyError
    end
  end
  
  def clearCell(rank, file)
    @board[file][rank-@RANKINDEXSTART] = nil
  end
  
  def killPiece(piece)
    piece.rank = nil
    piece.file = nil
    piece.active = false
  end
  
  def isCellAvailable(color, rank, file)
    currentPieceAtCell = getPieceAtCell(file, rank)
    return true if (currentPieceAtCell==nil) or (currentPieceAtCell.color!=color)
    false
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
  
  def placePieceAtCell(piece, file, rank)
    @board[file][rank-@RANKINDEXSTART] = piece
    piece.file = file
    piece.rank = rank
    piece.active = true
  end
  
  def getPieceAtCell(file, rank)
    begin
      @board[file][rank-@RANKINDEXSTART]
    rescue NoMethodError
      return nil
    end
  end
  
  def getEmptyCells
    empty_cells = []
    @board.each_key do |file|
      @board[file].each_with_index do |rank, index|
        empty_cells.push(file.to_s+(index+1).to_s) if rank == nil
      end
    end
    empty_cells
  end
  
end