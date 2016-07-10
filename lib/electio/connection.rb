require 'plissken'
require 'hashie/mash'

module Electio
  class Connection
    attr_accessor :uri, :params, :body, :request, :headers

    def self.get(options = {})
      new(options).get
    end

    def self.post(options = {})
      new(options).post
    end

    def initialize(options = {})
      self.uri     = Electio.base_uri.merge(options.fetch(:end_point))
      self.uri     = uri.merge(options[:record]) if options[:record]
      self.params  = options[:params]
      self.body    = options[:body] 
      self.headers = options[:headers] || {}
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

    def make_request
      set_headers
      https_conn do |https|
        https.request request
      end
    end

    def build_object
      response = make_request
      hash = JSON.load(response.body).to_snake_keys
      response_object = Hashie::Mash.new(hash)
      response_object.status_code = response.code.to_i unless response_object.status_code
      response_object
    end

    def set_headers
      default_headers.merge(headers).each do |k, v|
        request.add_field(k, v)
      end
    end

    def default_headers
      { 
        "ocp-apim-subscription-key" => Electio.configuration.api_key,
        "content-type" => "application/json" 
      }
    end

    def https_conn(&block)
      https_conn = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
      block.yield(https_conn)
    ensure
      https_conn.finish
    end
  end
end