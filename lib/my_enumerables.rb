module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    self.my_each do |num|
      yield(num, index)
      index += 1
    end
  end

  def my_select
    arr = []
    return to_enum(:my_select) unless block_given?

    self.my_each do |num|
      arr << num if yield(num)
    end

    arr
  end

  def my_all?
    self.my_each do |num|
      return false unless yield(num)
    end

    return true
  end

  def my_any?
    self.my_each do |num|
      return true if yield(num)
    end

    return false
  end

  def my_none?
    self.my_each do |num|
      return false if yield(num)
    end

    return true
  end

  def my_count
    return self.length unless block_given?

    count = 0
    self.my_each do |elem|
      count += 1 if yield(elem)
    end

    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    arr = []

    self.my_each do |elem|
      arr << yield(elem)
    end

    arr
  end

  def my_inject(item)
    result = item
    self.my_each do |elem|
      result = yield(result, elem)
    end

    result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    self.each do |num|
      yield(num)
    end
  end
end

