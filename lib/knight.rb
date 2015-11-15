require 'chessPiece'

class Knight < ChessPiece
  def initialize(color)
    super(color.upcase, ChessPiece.allowedTypes[:Knight])
  end

end