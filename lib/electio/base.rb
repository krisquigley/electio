module Electio
  class Base
    def self.all
      Electio::Connection.new(end_point: self::END_POINT).get
    end

    def self.find(record)
      Electio::Connection.new(end_point: self::END_POINT, record: record).get
    end

    attr_accessor :params

    def initialize(params = {})
      self.params = params
    end

    def save
      Electio::Connection.new(end_point: self.class::END_POINT, body: params).post
    end
  end
end