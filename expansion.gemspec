# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require './lib/version'
 
Gem::Specification.new do |s|
  s.name         = "expansion"
  s.version      = Expansion::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Christian Blais"]
  s.email        = ["christ.blais@gmail.com"]
  s.homepage     = "http://github.com/christianblais/expansion"
  s.summary      = "Dynamic model attributes"
  s.description  = "Dynamic model attributes"
  
  s.add_dependency 'haml', '>=3.1.0'
  s.add_dependency 'inherited_resources'
  
  s.files = `git ls-files`.split("\n")
  
  s.require_paths = ['lib', 'app']
end
