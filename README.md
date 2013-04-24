serialworker
============

Serialworker is a gem to ease working with serial ports through ruby.

Open a Serial Port
============ 
```ruby
# OPEINING /dev/ttyUSB0
sp = Serialworker::Serialworker.new("/dev/ttyUSB0")
```

Reading
============
```ruby
# READ 6 BIT AND RETURN THEM AS STRING
sp.read(:bits => 5)
# READ TILL A CARRIAGE RETURN IS RECEIVED
sp.read(:stop => '\r')
# RETURNS AN ARRAY OF 6 INTEGER VALUES
sp.read(:bits => 6, :format => :int)
# RETURNS AN ARRAY OF 6 Serialworker::Binary Objects
sp.read(:bits => 6, :format => :binary)	
# RETURNS AN ARRAY WITH MIXED DATATYPES / FOR EACH BIT THERE IS A SPECIFICATION NEEDED
sp.read(:bits => 6, :format => :mixed, :mix_definition => [:binary, :int, :int, :int, :ascii, :ascii])
```

Writing
============
```ruby
# SENDING STRING AS ASCII
p.write("hello world")
# SENDING INTEGERS
p.write([123, 111, 12])
```
