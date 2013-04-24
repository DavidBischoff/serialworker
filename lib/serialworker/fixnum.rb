module Serialworker::Fixnum
  extend ActiveSupport::Concern

  def to_binary(bits = 8)
    Serialworker::Binary.from_fixnum(self, bits)
  end
end
