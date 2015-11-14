$: << './lib'
require 'userInputGetter'
require 'chessBoard'
require 'chessPiece'
require 'bishop'
require 'knight'

class Chess
  def initialize
    @board = ChessBoard.new
    @numPieces = Integer(UserInputGetter.getNumPieces)
    if @numPieces> 0
      for currPieceNum in 1..@numPieces do
        initPiece currPieceNum
      end
    else
      print "\nCant play with no pieces.\n"
    end
  end
  
  def initPiece(pieceIndex)
    print "\nPiece %s\n"%(pieceIndex)
    color = UserInputGetter.getColor
    pieceType = UserInputGetter.getPieceType
                            
    case pieceType
    when ChessPiece.allowedTypes[:Knight]
      piece = Knight.new(color)
    when ChessPiece.allowedTypes[:Bishop]
      piece = Bishop.new(color)
    end
    print "\nInitialised %s in color %s\n"%[piece.pieceType, piece.color]
    position = UserInputGetter.getPosition(@board)
    @board.place(piece, position)
    print "\nType: %s, Color %s, placed at file %s, rank %s\n"%[piece.pieceType, piece.color, piece.file, piece.rank]
  end
end

while true
  begin
    game = Chess.new
    continue = UserInputGetter.getProperty(["Y", "N"], "Continue (Y/N)?: ", "Only Y or N allowed. Contrl-C anytime to Exit")
    if continue == "N"
      break
    end
  rescue Interrupt
    print "\n\nExiting game.\n\n"
    break
  end
end