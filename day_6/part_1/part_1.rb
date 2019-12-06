class Tree
  class Node
    def initialize(name)
      @name = name
    end

    attr_reader :name
    attr_accessor :parent
  end

  def initialize
    @nodes = []
  end

  def find_or_create_node_by(space_object_name)
    find_node_by(space_object_name) || create_node_by(space_object_name)
  end

  def find_node_by(space_object_name)
    nodes.find { |node| node.name == space_object_name }
  end

  def create_node_by(space_object_name)
    node = Node.new(space_object_name)
    nodes << node
    node
  end

  def create_tree(input)
    input.each do |pair|
      parent_space_object_name, orbiting_space_object_name = pair.split(')')
      parent_node = find_or_create_node_by(parent_space_object_name)
      child_node = find_or_create_node_by(orbiting_space_object_name)
      child_node.parent = parent_node
    end
  end

  def count_orbits
    orbits = 0
    nodes.each do |node|
      current_parent = node.parent
      loop do
        break if current_parent.nil?
        orbits += 1
        current_parent = current_parent.parent
      end
    end
    orbits
  end

  attr_accessor :nodes
end

input = File.read('input.txt').split("\n")
tree = Tree.new
tree.create_tree(input)
p tree.count_orbits
