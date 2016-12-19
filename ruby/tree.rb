#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def self.init_from_hash(tree)
    throw 'too many parents!' if tree.keys.length > 1
    children = []
    node_name = tree.keys.first
    child_hash = tree[node_name]

    child_hash.each do |child_name, child_children|
      children.push ( Tree.init_from_hash ( {child_name => child_children } ))
    end

    Tree.new node_name, children
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new( "Ruby",
  [Tree.new("Reia"),
   Tree.new("MacRuby")] )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

hash = {'grandpa'=>{'dad'=>{'child 1'=>{}, 'child 2'=>{}},'uncle'=>{}}}
easy_tree = Tree.init_from_hash hash
puts 'visiting easily initialized tree'
easy_tree.visit_all {|node| puts node.node_name }

puts 'iterating in groups of four with only each'
slices = []
(1..16).each do |n|
  slice_index = (n-1)/4
 if slices[slice_index]
   slices[slice_index].push n
 else
   slices.push [n]
 end
end
class Array
  def sum
    self.inject{|collector,item| collector + item}
  end
end
slices.each{|s| puts s.sum}

puts 'iterating in groups of 4 with each_slice'
(1..16).each_slice(4) do |s|
  puts s.sum
end

