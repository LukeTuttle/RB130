require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  attr_reader :todos, :list
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, list.size)
  end

  def test_first
    assert_equal(@todo1, list.first)
  end

  def test_last
    assert_equal(@todo3, list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
  end
  
  def test_raise_nontodo_added
    assert_raises(TypeError) { list.add(3) }
    assert_raises(TypeError) { list.add('hi') }
  end
  
  def test_shovel_operator
    new_todo = Todo.new("Feed the cat")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    new_todo = Todo.new("Feed the cat")
    list.add new_todo
    todos << new_todo

    assert_equal(todos, list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) {list.item_at(50)}
    assert_equal(@todo1, list.item_at(0))
    assert_equal(@todo2, list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) {list.item_at(50)}
    list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) {list.item_at(50)}
    @todo1.done!
    @todo2.done!
    @todo3.done!
    
    list.mark_undone_at(1)
    
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done_bang
    list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {list.item_at(50)}
    assert_equal(@todo2, list.remove_at(1))
    assert_equal([@todo1, @todo3], list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @todo1.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    titles = [@todo1.title, @todo2.title, @todo3.title]
    titles2 = []
    list.each { |item| titles2 << item.title }

    assert_equal(titles, titles2)
  end

  def test_each_returns_original_list
    assert_equal(list, list.each(&:title))
  end

  def test_select
    new_list = list.select { |item| item.title == 'Go to gym' }

    refute_same(new_list, list)
    assert_equal([@todo3], new_list.to_a)
  end
end