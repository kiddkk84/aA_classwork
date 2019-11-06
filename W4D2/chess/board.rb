require_relative "./piece.rb"

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    #Populate
    @rows.each.with_index do |row, i|
      @rows.each_index do |j|
        if i == 0  #black
          if [0,2,4,5,7].include?(j)
            @rows[i][j] = RookBishopQueen.new(:black, self, [i,j])
          elsif
            @rows[i][j] = KnightKing.new(:black, self, [i,j])
          end
        elsif i == 1 
          @rows[i][j] = Pawn.new(:black, self, [i,j])
        elsif i == 6   
           @rows[i][j] = Pawn.new(:white, self, [i,j])
        elsif i == 7 
          if [0,2,4,5,7].include?(j)
          @rows[i][j] = RookBishopQueen.new(:white, self, [i,j])
          elsif
          @rows[i][j] = KnightKing.new(:white, self, [i,j])
          end 
        end
      end
    end


    # private
    # @sentinel = NullPiece.instance
  end

  def [](pos)
    rows[pos[0]][pos[1]]
  end

  def []=(pos,val)
    rows[pos[0]][pos[1]] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == nil 
      raise "Cannot move"
    elsif self[end_pos] != nil 
      raise "Cannot move"
    end 

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos] 

  end 


end 

p b = Board.new
