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

        new_parent.children << self
        @parent = new_parent
    end

end


test_node_1 = PolyTreeNode.new('A')
test_node_2 = PolyTreeNode.new('B')
test_node_3 = PolyTreeNode.new('C')

test_node_2.parent = test_node_1
test_node_3.parent = test_node_2


p test_node_1.value
p test_node_1.parent
p test_node_1.children

p test_node_2.value
p test_node_2.parent
p test_node_2.children

p test_node_3.value
p test_node_3.parent
p test_node_3.children


test_node_3.parent = test_node_1

p test_node_1.value
p test_node_1.parent
p test_node_1.children.length

p test_node_2.value
p test_node_2.parent
p test_node_2.children.length

p test_node_3.value
p test_node_3.parent
p test_node_3.children.length


