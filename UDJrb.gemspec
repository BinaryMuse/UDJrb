# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "UDJrb/version"

Gem::Specification.new do |s|
  s.name        = "UDJrb"
  s.version     = UDJrb::VERSION
  s.platform    = Gem::Platform::CURRENT
  s.authors     = ["Brandon Tilley"]
  s.email       = ["brandon@brandontilley.com"]
  s.homepage    = ""
  s.summary     = %q{Classes and extensions to make working with the UniData Java API easier.}
  s.description = %q{Classes and extensions to make working with the UniData Java API easier.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
