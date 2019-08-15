# require 'net/http'
require 'uri'
require 'httparty'

%w(base version audit export template actions).each {|package| require "iAuditor/#{package}"}


module IAuditor

  class << self

    def client(token)
      IAuditor::Base.new(token)
    end

    def token(user, pass, grant)
      IAuditor::Base.token(user, pass, grant)
    end

  end

end

#
# a = IAuditor.client(IAuditor::Base.token(Email, Password, grantType))
# a.audits.search -- This will give the array of audits..
# a.audits.search({ field: "audit_id",field: "modified_at"  }) --- retrieve any specific fields
# a.audits.search({ field: "audit_id",field: "modified_at", modified_at: "2018-04-03T11:15:26.644Z"  }) --- retrieve any specific fields
# a.audits.search({ field: "audit_id",field: "modified_at", modified_at: "2018-04-03T11:15:26.644Z"  }) --- retrieve any specific fields
# a.audits.search({ field: "audit_id",field: "modified_at", modified_after: "2018-04-03T11:15:26.644Z"  }) --- Searching by modification date:
# a.audits.search({ template: "template_37afc5890aa94e778bbcde4fc4cbe480"  }) --- Searching by template:
# a.audits.search({ archived: "both"  }) --- Including archived audits:
# a.audits.search({ completed: "true"  }) --- Including only completed audits:
# a.audits.fetch(audit_c4fa538a4a11478584478913eee40d3b) -- retrieving an audit
# a.actions.search({audit_id: ["audit_0d7de5501565420d9fca02cb1f2cda5a", "audit_c25e7a5c130a41788b1ccb24c002e934"]})
# a.templates.search()
# a.export.profiles()
