require 'awrence'

module Electio
  class Base
    def self.all(query = false)
      Connection.new(end_point: self::END_POINT, query: query).get
    end

    def self.find(record)
      Connection.new(end_point: self::END_POINT, query: record).get
    end

    def self.find_by(query)
      Connection.new(end_point: "#{self::END_POINT}/#{query.keys.first.to_s.delete('_')}/", query: query.values.first).get
    end

    def self.update(params)
      new(params).update
    end

    attr_accessor :params

    def initialize(params = {})
      self.params = params.to_camel_keys
    end

    def save
      Connection.new(end_point: self.class::END_POINT, body: params).post
    end

    def update
      Connection.new(end_point: self.class::END_POINT, body: params).put
    end
  end
end