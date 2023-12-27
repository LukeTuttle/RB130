# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
    nil
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
    nil
  end

  def done!
    todos.each(&:done!)
    nil
  end

  alias_method :mark_all_done, :done!

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end


  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |item|
      list.add(item) if yield(item)
    end
    list
  end

  def find_by_title(target_title)
    todos.find(proc {nil}) { |item| item.title == target_title }
  end

  def all_done
    select {|item| item.done?}
  end

  def all_not_done
    select {|item| !(item.done?)}
  end

  def mark_done(target_title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_undone
    # each { |item| item.undone! }
    each(&:undone!)
  end

  protected

  attr_writer :todos

  private

  attr_reader :todos

end




# TEST

# 
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)


puts list
list.mark_done('Clean room')
list.mark_done_at(0)
puts list

list.mark_all_done
puts list
puts "SHOULD BE ALL DONE"

list.mark_all_undone
puts list