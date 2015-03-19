require 'spec_helper'

describe Abstractize do
  it 'has a version number' do
    expect(Abstractize::VERSION).not_to be nil
  end

  describe '.new' do
    let(:abstract_class) do
      Class.new { include Abstractize }
    end

    let(:abstract_class_with_initializer) do
      Class.new do
        include Abstractize

        attr_reader :foo

        def initialize(bar)
          @foo = bar
        end
      end
    end

    let(:subclass) do
      Class.new(abstract_class)
    end

    let(:subclass_with_inherited_initializer) do
      Class.new(abstract_class_with_initializer)
    end

    it 'raises an AbstractError on including class' do
      expect { abstract_class.new }.to raise_error(AbstractError)
      expect { abstract_class_with_initializer.new(:foo) }.to raise_error(
        AbstractError
      )
      subclass.new
    end

    it 'calls initializers correctly' do
      instance = subclass_with_inherited_initializer.new(:bar)
      expect(instance.foo).to eq(:bar)
    end
  end

  describe '.abstract_method' do
    let(:abstract_class) do
      Class.new do
        include Abstractize

        define_abstract_method :foobar
      end
    end

    it 'defines a method' do
      expect(abstract_class.method_defined?(:foobar)).to be(true)
    end

    it 'defines method to raise AbstractError' do
      instance = Class.new(abstract_class).new
      expect { instance.foobar }.to raise_error(AbstractError)
    end

    it 'raises AbstractError with any amount of params' do
      instance = Class.new(abstract_class).new
      expect { instance.foobar(:foo) }.to raise_error(AbstractError)
      expect { instance.foobar(:foo, :bar) }.to raise_error(AbstractError)
    end
  end
end
