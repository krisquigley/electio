module Helpers
  def authenticate
    Electio.configure do |config|
      config.api_key = ENV['API_KEY']
    end
  end
end
