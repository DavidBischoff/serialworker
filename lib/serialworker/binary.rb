module Serialworker
  class Binary
    attr_accessor :value

    def initialize(value, bits = 8)
      return false unless value.kind_of?(String)
      return false unless value.is_binary?
      return false if value.length > bits
      self.value = value
    end
  
    def self.from_string(str, bits = 8)
      return false unless str.kind_of?(String)
      return false unless str.is_binary?
      return false if str.length > bits
      (bits-str.length).times do
        str = "0" + str
      end
      self.new(str)
    end

    def self.from_fixnum(int, bits = 8)
      return false unless int.kind_of?(Fixnum)
      str = int.to_s(2)
      return false if str.length > bits
      self.from_string(str, bits)
    end
  
    def to_i
      self.value.to_i(2)
    end
   
    def to_s
      self.value
    end

    def ==(other)
      if other.kind_of?(self.class)
        self.value == other.value
      elsif other.kind_of?(String)
        self.value == other
      elsif other.kind_of?(Fixnum)
        self.to_i == other
      else
        return false
      end
    end
   
    def >(other)
      if other.kind_of?(self.class)
        self.to_i > other.to_i
      elsif other.kind_of?(String)
        self.to_i > other.to_i(2)
      elsif other.kind_of?(Fixnum)
        self.to_i > other
      else
        return false
      end
    end

    def <(other)
      if other.kind_of?(self.class)
        self.to_i < other.to_i
      elsif other.kind_of?(String)
        self.to_i < other.to_i(2)
      elsif other.kind_of?(Fixnum)
        self.to_i < other
      else
        return false
      end
    end

    def invert
      self.value.gsub!("0", "X")
      self.value.gsub!("1", "0")
      self.value.gsub!("X", "1")
      self
    end

    def reverse
      self.value = self.value.reverse
      self
    end

    def bit(n)
      return false unless n.kind_of?(Fixnum)
      self.reverse[n] == "1"
    end
  end
end
