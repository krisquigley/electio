module Electio
  class Connection
    attr_accessor :uri, :params, :body, :response

    def self.get(options = {})
      new(options).get
    end

    def self.post(options = {})
      new(options).get
    end

    def initialize(options)
      self.uri    = Electio.base_uri.merge(options.fetch(:end_point))
      self.params = options[:params]
      self.body   = options[:body] 
      uri.query = URI.encode_www_form(params)
    end

    def get
      self.response = Net::HTTP.get_response(uri)
      build_object
    end

    def post
      self.response = Net::HTTP.post_form(uri, params)
      build_object
    end

    private

    def build_object
      response_object = OpenStruct(response.body)
      response_object.status = response.code
      response_object
    end
  end
end