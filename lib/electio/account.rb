module Electio
  class Account < Base
    END_POINT = "/accounts/".freeze

    def self.find(record)
      record = URI.escape(record, "@")
      super
    end

    def self.all
      raise NotImplementedError
    end
  end
end