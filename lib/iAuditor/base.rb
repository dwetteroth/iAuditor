require "iAuditor/base_modules"
module IAuditor
  class Base

    include BaseModules::Methods

    def audits
      IAuditor::Audit.new(@options)
    end

    def templates
      IAuditor::Template.new(@options)
    end

    def actions
      IAuditor::Actions.new(@options)
    end

    def export
      IAuditor::Export.new(@options)
    end

    def self.token(username, password, grant_type)
      token = HTTParty.post('https://api.safetyculture.io/auth',
      :body => {
                  "username": username,
                  "password": password,
                  "grant_type":"password"
               }
      ).parsed_response["access_token"]
      token
    end

  end
end
