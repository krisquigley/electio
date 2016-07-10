require 'awrence'

module Electio
  class Base
    def self.all
      Connection.new(end_point: self::END_POINT).get
    end

    def self.find(record)
      Connection.new(end_point: self::END_POINT, record: record).get
    end

    attr_accessor :params

    def initialize(params = {})
      self.params = params.to_camel_keys
    end

    def save
      Connection.new(end_point: self.class::END_POINT, body: params).post
    end
  end
end