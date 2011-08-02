# 
# Lets you question objects and instances directly using seemingly functional method at runtime.
# Example:
#   Symbol?(:foo)  # => true
#   Symbol?("foo") # => false
# 
module ConstantQuestioning
  # All ze magics in here
  def method_missing meffod, *args
    # Check if we want to handle it or not
    if ((klass = meffod.to_s[/\A([[:upper:]]\w+)\?\z/, 1]))
      askee = respond_to?(:const_get) ? self : self.class
      # Turn the symbol into a constant - this'll raise if you've mis-typed
      klass = askee.const_get(klass)
      # Check all the args!
      args.all? {|e| e.is_a?(klass) }
    else
      super
    end
  end
end
Object.send(:include, ConstantQuestioning)
