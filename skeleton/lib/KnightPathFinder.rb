require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :root_node
    def self.valid_moves(pos)
        
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        self.build_move_tree
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        @considered_positions << pos if KnightPathFinder.valid_moves(pos)
    end

    def build_move_tree
        self.root_node
    end

    def find_path
    
    end

end