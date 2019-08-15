

class BaseModules
  module Methods

    def initialize(token)
      @options = token.is_a?(String) ? {
          headers: {
              "Content-Type" => "application/json",
              "Authorization"=> "Bearer #{token}"
          }
      }
      : token

    end





    def self.included(base)
      # "HTTParty".constantize does not support in plain ruby -- If you have ActiveSupport loaded (e.g. in Rails) you can use
      base.send :include, Object.const_get("HTTParty")
      base.send(:base_uri, "https://api.safetyculture.io")
    end

  end
end
