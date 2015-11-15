class InvalidValueError < Exception
end

class UserInputGetter

  def self.getProperty(allowedValues, prompt, errorMessage, board=nil)
    while true do
      begin
        print "\n%s"%[prompt]
        val = gets.chomp.upcase
        if allowedValues!=[]
          raise InvalidValueError unless allowedValues.map{|i|String(i)}.include?(val)
        end
        if board != nil
          board.getPositionCoords(val)
        end
        return val
      rescue InvalidValueError
        print "\n%s. Try again.\n"%[errorMessage]
        next
      rescue InvalidPositionError
        print "\nInvalid Position %s. Try again.\n"%[val]
        next
      rescue NotEmptyError
        print "\nPosition %s not empty. Try again.\n"%[val]
        next
      end
    end
  end
  
  def self.getNumPieces
    self.getProperty([*0..64],"Enter number of pieces: ", "Only integers 0-64 please")
  end
  
  def self.getColor
    self.getProperty(ChessPiece.allowedColors.values,"Enter colour (W/B): ",
                     "Only allowed colors are %s"%[ChessPiece.allowedColors.inspect])
  end
  
  def self.getPieceType
    self.getProperty(ChessPiece.allowedTypes.values,"Enter type (B/N): ", 
                     "Only allowed types are %s"%[ChessPiece.allowedTypes.inspect])
  end
  
  def self.getContinue
    self.getProperty(["Y", "N"], "Continue (Y/N)?: ", "Only Y or N allowed. Contrl-C anytime to Exit")
  end
  
  def self.getPosition(board)
    self.getProperty([],"Enter position (A1-H8): ", "", board)
  end
  
  
end