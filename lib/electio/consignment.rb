module Electio
  class Consignment < Base
    END_POINT = "/consignments".freeze

    def all
      raise NotImplementedError
    end
  end
end