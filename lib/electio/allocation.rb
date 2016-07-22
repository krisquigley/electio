module Electio
  class Allocation < Base
    END_POINT = "/allocation/".freeze

    def self.find(record)
      raise NotImplementedError
    end

    def self.find_by(query)
      raise NotImplementedError
    end

    def self.all
      raise NotImplementedError
    end

    def self.update(params)
      raise NotImplementedError
    end

    def save
      determine_allocation_type

      Connection.new(end_point: self.class::END_POINT, body: params, query: query).put
    end

    def update
      raise NotImplementedError
    end

    private

    attr_accessor :query  

    def determine_allocation_type
      if params.include?("ConsignmentReferences") and !params.include?("MpdCarrierServiceReference") # ALLOCATE_WITH_DEFAULT_RULES
        self.query = "allocate" 
      else
        raise NotImplementedError, "Only Allocate with Default Rules is supported"
      end
    end
  end
end