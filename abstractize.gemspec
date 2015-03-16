# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abstractize/version'

Gem::Specification.new do |spec|
  spec.name          = 'abstractize'
  spec.version       = Abstractize::VERSION
  spec.authors       = ['Joakim Reinert']
  spec.email         = ['mail@jreinert.com']

  spec.metadata['allowed_push_host'] = 'https://rubygems.org' if spec.respond_to?(:metadata)

  spec.summary       = 'Simple mixin to provide abstract class functionality'
  spec.homepage      = 'https://github.com/jreinert/abstractize'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'pry-byebug', '~> 3.0'
end
