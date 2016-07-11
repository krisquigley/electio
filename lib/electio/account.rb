module Electio
  class Account < Base
    END_POINT = "/accounts/".freeze

    def self.find(record)
      record = record.gsub("@", "%40")
      super
    end

    def self.all
      raise NotImplementedError
    end
  end
end