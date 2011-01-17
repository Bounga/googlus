# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "googlus/version"

Gem::Specification.new do |s|
  s.name        = "googlus"
  s.version     = Googlus::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolas Cavigneaux"]
  s.email       = ["nico@bounga.org"]
  s.homepage    = "https://bitbucket.org/Bounga/googlus/"
  s.summary     = %q{Ruby wrapper for Google URL Shortener REST API}
  s.description = %q{Provides an easy access to Google URL Shortener API using Ruby code or command-line}

  s.add_development_dependency "rspec"
  s.add_development_dependency "rdoc"
  s.add_dependency "json_pure"

  s.rubyforge_project = "Googlus"

  s.files         = `hg manifest`.split("\n")
  s.test_files    = `hg manifest`.split("\n").select { |f| f =~ /^(test|spec|features)/ }
  s.executables   = `hg manifest`.split("\n").select { |f| f =~ /^bin/ }.map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
