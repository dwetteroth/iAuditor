module IAuditor
  class Export
    include BaseModules::Methods

    def profiles(options={})
      @options.merge!(query: options) if options.present?
      @profiles = self.class.get("/export_profiles/search", @options)
    end

  end
end