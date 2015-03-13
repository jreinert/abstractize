require 'abstract/version'
require 'abstract/abstract_error'

# Mixin for abstract classes
module Abstract
  def self.included(base)
    (class << base; self; end).instance_eval do
      define_method(:new, Abstract.abstract_new(base))
      define_method(:define_abstract_method, Abstract.abstract_method)
    end
  end

  protected

  def abstract_new(base)
    lambda do |*args|
      instance = super(*args)
      fail AbstractError, "cannot instanciate #{name}" if self == base
      instance
    end
  end

  def abstract_method
    lambda do |name|
      define_method(name) do
        fail AbstractError, 'not implemented'
      end
    end
  end

  module_function :abstract_new
  module_function :abstract_method
end
