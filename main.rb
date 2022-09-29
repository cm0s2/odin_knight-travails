# frozen_string_literal: true

require_relative 'lib/board'

POSSIBLE_MOVES = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]].freeze

# Graph vertex class
class Node
  attr_reader :parent, :coords

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
  end

  def to_s
    coords.to_s
  end

  def print_path
    @parent&.print_path # Save nagivation, prints only if parent exists

    p @coords
  end

  def num_moves
    return @parent.num_moves + 1 unless @parent.nil?

    0
  end
end

# Code
def knight_moves(start, goal)
  board = Board.new(8, 8)

  found_goal = false

  queue = []
  visited = [] # Used to prevent revisiting nodes
  queue.push(Node.new(start))

  until queue.empty? || found_goal
    current = queue.shift
    visited.push(current)

    if current.coords == goal
      found_goal = true
      puts "You made it in #{current.num_moves} moves! Here's your path:"
      current.print_path
    end

    # Visit valid children
    POSSIBLE_MOVES.each do |offset|
      position = [current.coords[0] + offset[0], current.coords[1] + offset[1]]
      next if board.invalid_position?(position) # Outside board

      # Add children to queue
      queue.push(Node.new(position, current)) unless visited.include?(position)
    end
  end
end

knight_moves([3, 3], [4, 3])
