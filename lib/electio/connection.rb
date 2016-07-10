module Electio
  class Connection
    attr_accessor :uri, :params, :body, :request

    def self.get(options = {})
      new(options).get
    end

    def self.post(options = {})
      new(options).post
    end

    def initialize(options = {})
      self.uri    = Electio.base_uri.merge(options.fetch(:end_point))
      self.uri    = uri.merge(options[:record]) if options[:record]
      self.params = options[:params]
      self.body   = options[:body] 
    end

    def get
      uri.query = URI.encode_www_form(params) if params
      self.request = Net::HTTP::Get.new uri
      
      build_object
    end

    def post
      self.request = Net::HTTP::Post.new(uri)
      request.body = body.to_json

      build_object
    end

    private

    def build_object
      set_headers
      response = https_conn do |https|
        https.request request
      end

      response_object = OpenStruct.new(JSON.load(response.body))
      response_object.status = response.code.to_i
      response_object
    end

    def set_headers
      Electio.headers.each do |k, v|
        request.add_field(k, v)
      end
    end

    def https_conn(&block)
      https_conn = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https')
      block.yield(https_conn)
    ensure
      https_conn.finish
    end
  end
end