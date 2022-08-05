require_relative 'poly_tree_node'

class KnightPathFinder

    def self.is_valid?(pos)
        return !(pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7)
    end

    def self.get_valid_moves(pos)
        valid_moves = []

        valid_moves << [pos[0] + 2, pos[1] - 1] if self.is_valid?([pos[0] + 2, pos[1] - 1])
        valid_moves << [pos[0] + 2, pos[1] + 1] if self.is_valid?([pos[0] + 2, pos[1] + 1])
        valid_moves << [pos[0] - 2, pos[1] - 1] if self.is_valid?([pos[0] - 2, pos[1] - 1])
        valid_moves << [pos[0] - 2, pos[1] + 1] if self.is_valid?([pos[0] - 2, pos[1] + 1])
        valid_moves << [pos[0] + 1, pos[1] - 2] if self.is_valid?([pos[0] + 1, pos[1] - 2])
        valid_moves << [pos[0] - 1, pos[1] - 2] if self.is_valid?([pos[0] - 1, pos[1] - 2])
        valid_moves << [pos[0] + 1, pos[1] + 2] if self.is_valid?([pos[0] + 1, pos[1] + 2])
        valid_moves << [pos[0] - 1, pos[1] + 2] if self.is_valid?([pos[0] - 1, pos[1] + 2])
    end

    def initialize(pos)
        @pos = pos
        @considered = []
        @root_node = PolyTreeNode.new(pos)
    end

    def build_move_tree
    end



end

p KnightPathFinder.get_valid_moves([3,3])