require 'tempfile'

module Electio
  class Label < Base
    END_POINT = "/labels/".freeze
    
    class << self
      attr_accessor :response
    end

    def self.find(record)
      self.response = super

      decode_files
      response
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

    def initialize
      raise NotImplementedError
    end      

    def self.decode_files
      case response.content_type
      when "application/pdf"
        file = Tempfile.new(['labels','.pdf'])
        file.write(Base64.decode64(response.file))
        file.rewind
        file.close
        response.file = file
      end
    end
  end
end