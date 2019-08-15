module IAuditor
  class Template
    include BaseModules::Methods


    # Retrieving all audits with the given search criteria
    def search(options={})
      @options.merge!(query: options) if options.present?
      @templates = self.class.get("/templates/search", @options)
      @templates.parsed_response
    end

  end
end
