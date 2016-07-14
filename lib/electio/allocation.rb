module Electio
  class Allocation < Base
    END_POINT = "/allocation/".freeze

    def self.allocate(records)
      Connection.new(end_point: "#{self::END_POINT}allocate", body: records).put
    end

    def self.all
      raise NotImplementedError
    end
  end
end