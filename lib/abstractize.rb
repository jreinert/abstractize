require 'abstractize/version'
require 'abstractize/abstract_error'

# Mixin for abstract classes
module Abstractize
  def self.included(base)
    (class << base; self; end).instance_eval do
      define_method(:new, Abstractize.abstract_new(base))
      define_method(:define_abstract_method, Abstractize.abstract_method)
    end
  end

  protected

  def abstract_new(base)
    lambda do |*args|
      fail AbstractError, "cannot instanciate #{name}" if self == base
      super(*args)
    end
  end

  def abstract_method
    lambda do |name|
      define_method(name) do |*_args|
        fail AbstractError, 'not implemented'
      end
    end
  end

  module_function :abstract_new
  module_function :abstract_method
end
