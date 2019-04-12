require 'byebug'
class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        # debugger
        @parent = node
        return nil if parent.nil?
        node.parent.children.delete(self) if node.parent
        node.children << self if !node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise error if !self.children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target)
        # debugger
        return self if self.value == target 

        self.children.each do |ele|
            answer = ele.dfs(target)
            return answer if answer
        end

        nil
    end

    def bfs(target)
        queue = []

        queue.unshift(self)
        # debugger
        until queue.empty? 
            ans = queue.pop
            if ans.value == target
                return ans 
            end
            if !ans.children.empty?
                ans.children.each {|child| queue.unshift(child)}
            end
        end

        return nil
    end
end

n1 = PolyTreeNode.new(1)

n2 = PolyTreeNode.new(2)

n3 = PolyTreeNode.new(3)

n4 = PolyTreeNode.new(4)

n5 = PolyTreeNode.new(5)

n6 = PolyTreeNode.new(6)

n7 = PolyTreeNode.new(7)

n1.add_child(n2)
n1.add_child(n3)

n2.add_child(n4)
n2.add_child(n5)

n3.add_child(n6)
n3.add_child(n7)