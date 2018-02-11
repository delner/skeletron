
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skeletron/version'

Gem::Specification.new do |spec|
  spec.name          = 'skeletron'
  spec.version       = Skeletron::VERSION
  spec.authors       = ['David Elner']
  spec.email         = ['david@davidelner.com']

  spec.summary       = 'Library for building use-case-driven Ruby applications.'
  spec.description   = 'Library for building use-case-driven Ruby applications.'
  spec.homepage      = 'http://github.com/delner/skeletron'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'pry-stack_explorer', '~> 0.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.50'
  spec.add_development_dependency 'simplecov', '~> 0.15'
end
