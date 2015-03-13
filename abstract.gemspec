# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abstract/version'

Gem::Specification.new do |spec|
  spec.name          = 'abstract'
  spec.version       = Abstract::VERSION
  spec.authors       = ['Joakim Reinert']
  spec.email         = ['reinert@meso.net']

  spec.metadata['allowed_push_host'] = 'NONE' if spec.respond_to?(:metadata)

  spec.summary       = 'Simple mixin to provide abstract class functionality'
  spec.homepage      = 'https://git.meso.net/ws/abstract'
  spec.license       = 'other'

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
