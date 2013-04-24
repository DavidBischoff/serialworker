module Serialworker
end

require 'serialworker/fixnum.rb'
require 'serialworker/string.rb'
require 'serialworker/serialworker.rb'
require 'serialworker/binary.rb'

Fixnum.send :include, Serialworker::Fixnum
String.send :include, Serialworker::String
