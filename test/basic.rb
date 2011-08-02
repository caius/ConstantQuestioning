require File.expand_path("../lib/constant_questioning", File.dirname(__FILE__))

# Basic test suite. Should all output 'true'

# Check normal method_missing is being hit if we don't snarf it
begin
  bingo()
  raise "ERR: bingo() passed"
rescue NoMethodError => e
  p true
end

# Couple of constants for us to play with
class Fred
  class George
  end
end

# Some passing usecases
p Symbol?(:foo) == true
p Symbol?(:foo, :bar) == true
p String?("foo", "bar") == true


p String?(:foo) == false
p String?(:foo, :bar) == false
p String?("foo", :bar) == false

f = Fred.new
p Fred?(f) == true

fg = Fred::George.new
p Fred::George?(fg) == true
