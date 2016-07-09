module Electio
  class Base
    def self.all
      Electio::Connection.new(end_point: self::END_POINT).get
    end

    def self.find(record)
      Electio::Connection.new(end_point: self::END_POINT.merge("/#{record}")).get
    end

    attr_accessor :parameters

    def initialize(params = {})
      self.parames = params
    end

    def save
      Electio::Connection.new(end_point: self.class::END_POINT, params: params).post
    end
  end
end