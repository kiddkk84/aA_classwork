require 'singleton'

module Slideable

  #parameters: we need the piece's starting position. we need to know if the piece will be blocked in any direction. 
  #we want to return an array of all possible end positions piece could move to. 

  HORIZONTAL_DIRS = [[-1,0], [1,0], [0,-1], [0,1]]
  DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,1],[1,-1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs  
    DIAGONAL_DIRS
  end

  def moves
    #calls move_dirs and grow_unblocked
    #returns an array of moves in all directions that are unblocked
    moves = []
    move_dirs.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir[0],dir[1])
    end
    moves
  end

  private
  def move_dirs
    super
  end

  #iterate through all possible moves, starting from 1 up. grow node tree
  #if we find that a space is occupied by a piece (!= nil), then we stop?

  def grow_unblocked_moves_in_dir(dx,dy) #e.g. [dx,dy] = [-1,-1]
    #dx = -1, dy = 0
    sub_moves = []
    x_end = pos[0] + dx
    y_end = pos[1] + dy
    while board[x_end,y_end].nil? && (0..7).include?(x_end) && (0..7).include?(y_end)
        sub_moves << [x_end,y_end]
        x_end += dx
        y_end += dy
    end 
    sub_moves
  
    #adds steps in each direction until
    #1) if hits a piece
    #2) if it's off the board
    #returns an array of moves in that direction
    #adds to moves
  end

end

module Stepable #Knight and King
  HORIZONTAL_DIRS = [[-1,0], [1,0], [0,-1], [0,1]]
  DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,1],[1,-1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs  
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    
    if symbol == :King
      
      move_diffs.each do |dir|
        dx = dir[0]
        dy = dir[1]
        x_end = pos[0] + dx
        y_end = pos[1] + dy
        if (0..7).include?(x_end) && (0..7).include?(y_end) 
          if board[x_end,y_end].nil? || board[x_end,y_end].color != self.color
            moves << [x_end, y_end]
          end
        end
      end
    elsif symbol == :Knight
      knight_moves = [
                          [-2, -1],
                          [-2,  1],
                          [-1, -2],
                          [-1,  2],
                          [ 1, -2],
                          [ 1,  2],
                          [ 2, -1],
                          [ 2,  1]
                                    ]
      cur_x, cur_y = pos
      knight_moves.each do |(dx, dy)|
        new_pos = [cur_x + dx, cur_y + dy]   
        x_end = new_pos[0]
        y_end = new_pos[1]                           
        if (0..7).include?(x_end) && (0..7).include?(y_end)
          if board[x_end,y_end].nil? || board[x_end,y_end].color != self.color
            moves << [x_end, y_end]
          end
        end
      end
    end
    moves
  end

  private
  def move_diffs #returns array of all possible end positions
    super
  end

end



class Piece
  attr_reader :pos, :board, :color
  def initialize(color, board, pos)
    @color = color
    @board = board #instance of Board class
    @pos = pos
  end

  def to_s
  end

  def empty?
  end

  def valid_moves  #calls move into check, checks if piece is movable & color
    #returns array of all valid places a piece can move to. 
    #removes positions that are off the board, or end positions that are filled
  end

  #reassigns pos
  def reassign_pos(end_row,end_col)
    @pos = [end_row, end_col]
  end

  def symbol
    @symbol
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

  #why do we need a color or symbol? so we don't error out
  def symbol
  end
end

class Pawn < Piece
  attr_reader :symbol, :pos, :color
  def initialize(color,board,pos,symbol)
    @symbol = symbol
    super(color,board,pos)
  end

  def move_dirs
    
  end

  private
  def forward_dir
    [0,1]
  end

  def forward_steps
    steps = 0
    if self.color == :black
      if self.pos[0] == 1 #hasn't moved yet
        
      end

    elsif self.color == :white
      if self.pos[0] == 6 #hasn't moved yet
      end
    end
  
  end

  def side_attacks
  end
end

class KnightKing < Piece
  include Stepable
  attr_reader :symbol, :pos, :color
  def initialize(color,board,pos,symbol)
    @symbol = symbol
    super(color,board,pos)
  end

  protected
  #differentiates between knight and king
  def move_diffs 
    if symbol == :Knight
      horizontal_dirs
    elsif symbol == :King
      horizontal_dirs + diagonal_dirs
    end
  end
end

class RookBishopQueen < Piece
  include Slideable
  attr_reader :symbol, :pos
  def initialize(color,board,pos,symbol)
    @symbol = symbol
    super(color,board,pos)
  end

  protected
  #differentiates between rook, bishop, and queen

  def move_dirs 
    if symbol == :Rook
      horizontal_dirs
    elsif symbol == :Bishop
      diagonal_dirs
    elsif symbol == :Queen
      horizontal_dirs + diagonal_dirs
    end
  end
end

