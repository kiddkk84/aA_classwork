require 'singleton'
class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
    @board.rows[pos[0]][pos[1]] = val
  end

  def symbol
    @color
  end
  
  private
  def move_into_check?(end_pos)
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
  end

  def moves
  end

  def symbol
  end
end

class Pawn < Piece
  def initialize(color,board,pos)
    super(color,board,pos)
  end

  def symbol
    @color
  end
end

class KnightKing < Piece
  def initialize(color,board,pos)
    super(color,board,pos)
  end

  def symbol
    @color
  end
end

class RookBishopQueen < Piece
  def initialize(color,board,pos=[0,0])
    super(color,board,pos)
  end
  
  def symbol
    @color
  end
end

