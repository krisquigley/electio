module Electio
  class Base
    def self.all
      new.connection(end_point: self::END_POINT).get
    end

    attr_accessor :parameters

    def initialize(parameters = {})
      self.parameters = parameters
    end

    def connection(end_point: , params: )
      @connection ||= Electio::Connection.new(end_point: end_point, params: params).connect
    end

    def save
      response = connection(end_point: self.class::END_POINT, params: parameters) do |c|
        c.post
      end
      response_object = OpenStruct(response.body)
      response_object.status = response.code
      response_object
    end
  end
end