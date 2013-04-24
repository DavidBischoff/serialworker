Gem::Specification.new do |s|
  s.name        = 'serialworker'
  s.version     = '0.0.1'
  s.date        = '2013-04-22'
  s.summary     = "Serialworker"
  s.description = "A gem to work with serialports"
  s.authors     = ["David Bischoff"]
  s.email       = 'bischoff@faserinstitut.de'
  s.files       = ["lib/serialworker.rb", "lib/serialworker/string.rb", "lib/serialworker/fixnum.rb", "lib/serialworker/serialworker.rb", "lib/serialworker/binary.rb"]
  s.add_runtime_dependency "serialport"
end
