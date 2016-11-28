# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrthumb/version'

Gem::Specification.new do |spec|
  spec.name          = 'mrthumb'
  spec.version       = Mrthumb::VERSION
  spec.authors       = ['Martin Fernandez']
  spec.email         = ['fmartin91@gmail.com']

  spec.summary       = 'Ruby library for MrThumb API'
  spec.homepage      = 'https://github.com/MrThumb/mrthumb-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'api-auth', '~> 2.0'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'rubocop', '~> 0.4'
end
