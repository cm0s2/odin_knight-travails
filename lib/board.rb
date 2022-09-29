# frozen_string_literal: true

class Board
  def initialize(width, height)
    @board = Array.new(width) { Array.new(height) }
  end

  def width
    @board.length
  end

  def height
    @board[0].length
  end

  def invalid_position?(position)
    return true unless position[0].between?(0, width - 1)
    return true unless position[1].between?(0, height - 1)

    false
  end
end
