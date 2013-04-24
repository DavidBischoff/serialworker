module Serialworker
  class Serialworker
    require 'serialport'

    attr_accessor :serialport

    def initialize(port_number)
      self.serialport = SerialPort.new(port_number)
    end

    def read(options = {})
      options = { :bits => 1, :stop => nil, :format => :ascii, :mix_definition => [] }.merge(options)
      char = ""
      bytes = ""
      if options[:stop].nil?
        return false if options[:bits].nil?
        options[:bits].times do |c|
          char = self.serialport.getc
          bytes += char if !char.nil?
        end
        bytes
      else
        while(char != options[:stop])
          char = self.serialport.getc
          bytes += char if !char.nil?
        end
      end
      case options[:format]
        when :ascii
          return bytes
        when :int
          data = []
          bytes.each_char do |c| 
            data << c.ord
          end
          return data
        when :mixed
          return false unless options[:mix_definition].kind_of?(Array)
          return false unless options[:mix_definition].count == bytes.length
          data = []
          counter = 0
          bytes.each_char do |c|
            data << c.to_binary if options[:mix_definition][counter] == :binary
            data << c.ord if options[:mix_definition][counter] == :int
            data << c if options[:mix_definition][counter] == :ascii
            counter += 1
          end
          return data
        when :binary
          data = []
          bytes.each_char do |c|
            data << c.to_binary
          end
          return data
        else
          data
      end
    end

    def write(data)
      if data.kind_of?(String)
        data.each_char do |c|
          self.serialport.putc(c)
        end
      elsif data.kind_of?(Serialworker::Binary)
        self.serialport.putc(data.to_s)
      elsif data.kind_of?(Array)
        data.map!{|x| x.to_i }
        return false if data.max > 256
        data.each do |byte|
          self.serialport.putc(byte.chr)
        end
      end
    end
  end
end
