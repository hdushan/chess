class ChessPiece
  
  attr_reader :color, :pieceType
  attr_accessor :file, :rank
  attr_writer :active
  
  @@allowedColors = {:White=>"W", :Black=>"B"}
  @@allowedTypes = {:Bishop=>"B", :Knight=>"N"}
  @@test = 10
    
  def initialize(color, pieceType)
    @color = color
    @pieceType = pieceType
    @file = nil
    @rank = nil
    @active = false
  end
  
  def positionString
    return @file.to_s.upcase + @rank.to_s
  end
  
  def active?
    @active
  end
  
  def self.allowedColors
    @@allowedColors
  end
  
  def self.allowedTypes
    @@allowedTypes
  end
  
  def legalMoves(board)
    raise "Abstract method called"
  end
  
  def isDiffColor?(piece)
    @color.eql?(piece.color)
  end
  
  def postionStringFromCoords(file, rank)
    file.to_s.upcase+rank.to_s
  end
  
end