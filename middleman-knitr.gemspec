Gem::Specification.new do |s|
  s.name        = "middleman-knitr"
  s.version     = "0.0.1"
  s.authors     = ["Jamie F Olson"]
  s.email       = "self@jfolson.com"
  s.homepage    = "http://github.com/jamiefolson/middleman-knitr"
  s.summary     = %q{Add Knitr to Middleman}
  s.description = %q{Add Knitr to Middleman}
	
	s.add_dependency 'tilt'
	s.add_dependency 'tilt-knitr'
	s.add_development_dependency 'minitest'
    s.add_runtime_dependency("middleman-core", [">= 3.0.0"])

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
