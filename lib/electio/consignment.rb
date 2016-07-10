module Electio
  class Consignment < Base
    END_POINT = "/consignments/".freeze

    def self.all
      raise NotImplementedError
    end
  end
end