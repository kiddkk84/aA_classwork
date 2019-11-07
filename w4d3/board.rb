require_relative "./piece.rb"

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    #Populate
    @rows.each.with_index do |row, i|
      @rows.each_index do |j|
        if i == 0  #black
          if [0,7].include?(j)
            @rows[i][j] = RookBishopQueen.new(:black, self, [i,j],:Rook)
          elsif [2,5].include?(j)
            @rows[i][j] = RookBishopQueen.new(:black, self, [i,j],:Bishop)
          elsif j == 4 
            @rows[i][j] = RookBishopQueen.new(:black, self, [i,j],:Queen)
          elsif [1,6].include?(j)
            @rows[i][j] = KnightKing.new(:black, self, [i,j],:Knight)
          elsif j == 3 
              @rows[i][j] = KnightKing.new(:black, self, [i,j],:King) 
          end
        elsif i == 1 
          @rows[i][j] = Pawn.new(:black, self, [i,j], :Pawn)
        elsif i == 6   
           @rows[i][j] = Pawn.new(:white, self, [i,j],:Pawn)
        elsif i == 7 
          if [0,7].include?(j)
            @rows[i][j] = RookBishopQueen.new(:white, self, [i,j],:Rook)
          elsif [2,5].include?(j)
            @rows[i][j] = RookBishopQueen.new(:white, self, [i,j],:Bishop)
          elsif j == 4 
            @rows[i][j] = RookBishopQueen.new(:white, self, [i,j],:Queen)
          elsif [1,6].include?(j)
            @rows[i][j] = KnightKing.new(:white, self, [i,j],:Knight)
          elsif j == 3 
              @rows[i][j] = KnightKing.new(:white, self, [i,j],:King) 
          end
        end
      end
    end


    # private
    # @sentinel = NullPiece.instance
  end

  def [](row,col)
    @rows[row][col] 
  end

  def []=(row,col,val)
    @rows[row][col] = val
  end

  def move_piece(start_row,start_col,end_row,end_col)
    if self[start_row,start_col] == nil 
      raise "Cannot move"
    elsif self[end_row,end_col] != nil 
      raise "Cannot move"
    end 
    #need to reassign piece pos
    self[start_row,start_col].reassign_pos(end_row, end_col)
    #updates 2D grid
    self[start_row,start_col], self[end_row,end_col] = self[end_row,end_col], self[start_row,start_col] 
   
  end 


end 


# load "board.rb"
b=Board.new
king=b[0,3]
b.move_piece(0,3,5,4)
king.moves