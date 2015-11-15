$: << './lib'
$: << '../lib'
require 'userInputGetter'
require 'chessBoard'
require 'chessPiece'
require 'bishop'
require 'knight'

class Chess
  def initialize
    @board = ChessBoard.new
    @numPieces = Integer(UserInputGetter.getNumPieces)
    @pieces = []
    if @numPieces> 0
      for currPieceNum in 1..@numPieces do
        piece = initPiece currPieceNum
        @pieces.push(piece)
      end
    else
      print "\nCant play with no pieces.\n"
    end
    print "\nValid moves\n"
    @pieces.each_with_index do |piece, index|
      print "Piece %s, of type %s, of color %s, on cell %s: %s\n"%[index+1, piece.pieceType, piece.color, piece.positionString, piece.legalMoves(@board)]
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
    #print "\nInitialised %s in color %s\n"%[piece.pieceType, piece.color]
    position = UserInputGetter.getPosition(@board)
    @board.place(piece, position)
    #print "\nType: %s, Color %s, placed at file %s, rank %s\n"%[piece.pieceType, piece.color, piece.file, piece.rank]
    return piece
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