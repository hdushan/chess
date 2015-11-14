class ChessPiece
  
  attr_reader :color, :pieceType
  attr_accessor :file, :rank
  
  @@allowedColors = {:White=>"W", :Black=>"B"}
  @@allowedTypes = {:Bishop=>"B", :Knight=>"N"}
  @@test = 10
    
  def initialize(color, pieceType)
    @color = color
    @pieceType = pieceType
    @file = nil
    @rank = nil
  end
  
  def self.allowedColors
    @@allowedColors
  end
  
  def self.allowedTypes
    @@allowedTypes
  end
  
  def legalCells(board)
    raise "Abstract method called"
  end
  
  def isDiffColor?(piece)
    @color.eql?(piece.color)
  end
  
end