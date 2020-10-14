require_relative "piece.rb"

class Board
    def initialize
        @board = Array.new(8) {Array.new(8, nil)}
        [0,1,6,7].each do |i|
            @board[i] = Array.new(8) { Piece.new }
        end
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "invalid move" if self[start_pos].nil? || !self[end_pos].nil?

        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
end

