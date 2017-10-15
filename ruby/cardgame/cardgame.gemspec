# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cardgame"
  spec.version       = '1.0'
  spec.authors       = ["Michael Hatch"]
  spec.email         = ["mvhatch@gmail.com"]
  s.homepage         = "https://github.com/mvpmvh/developer-exercise"
  spec.summary       = "Generic Card Game Setup"
  s.description      = "Includes sample gameplay for blackjack"  
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.executables   = ['bin/blackjack']
  spec.test_files    = Dir.glob("tests/**/test*.rb")
  spec.require_paths = ["lib"]
end