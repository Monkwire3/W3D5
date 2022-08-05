class PolyTreeNode
    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if self.parent != nil
            self.parent.children.each_with_index do |el, i|
                self.parent.children.delete_at(i) if self.object_id == el.object_id
            end
        end

        new_parent.children << self if new_parent != nil
        @parent = new_parent
    end

    def add_child(child_node)
        child_node.parent = self 
    end
    
    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise "not a child"
        end
        child_node.parent = nil
    end
    require 'byebug'
    def dfs(target_value)
        #debugger
        p self.value
        if self.value == target_value
            return self 
        end
        self.children.each do |c| 
            recursed_value = c.dfs(target_value)
            return recursed_value if recursed_value != nil
        end
        return nil
    end


    def bfs(target_value)
        return self if self.value == target_value
        queue = []
        self.children.each {|c| queue << c}
        while !queue.empty?
            current = queue.shift
            #p current.value
            return current if current.value == target_value
            current.children.each {|c| queue << c}
        end
        # return nil if queue.empty?
        # queue.shift.bfs(target_value)
        return nil
    end
end


test_node_1 = PolyTreeNode.new('A')
test_node_2 = PolyTreeNode.new('B')
test_node_3 = PolyTreeNode.new('C')
test_node_4 = PolyTreeNode.new('D')
test_node_5 = PolyTreeNode.new('E')
test_node_6 = PolyTreeNode.new('F')

test_node_2.parent = test_node_1
test_node_3.parent = test_node_1
test_node_4.parent = test_node_2
test_node_5.parent = test_node_3
test_node_6.parent = test_node_5

p test_node_1.dfs('D')
# test_node_2.parent = test_node_1
# test_node_3.parent = test_node_2


# # p test_node_1.value
# # p test_node_1.parent
# # p test_node_1.children

# # p test_node_2.value
# # p test_node_2.parent
# # p test_node_2.children

# # p test_node_3.value
# # p test_node_3.parent
# # p test_node_3.children


# # test_node_3.parent = test_node_1

# # p test_node_1.value
# # p test_node_1.parent
# # p test_node_1.children.length

# # p test_node_2.value
# # p test_node_2.parent
# # p test_node_2.children.length

# # p test_node_3.value
# # p test_node_3.parent
# # p test_node_3.children.length


