module Serialworker::String
  extend ActiveSupport::Concern

  def to_binary(bits = 8)
    return false if self.empty?
    if self.length > 1
      binary = []
      self.each_char do |c|
        binary << Serialworker::Binary.from_string(c.ord.to_s(2), bits)
      end
    else
      binary = Serialworker::Binary.from_string(self.ord.to_s(2), bits)
    end
    binary
  end

  def is_binary?
    true
  end
end
