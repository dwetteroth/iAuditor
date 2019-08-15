module IAuditor
  class Actions
    include BaseModules::Methods



    # Retrieving actions
    def search(options={})
      @options.merge!(body: options.to_json) if options.present?
      @actions = self.class.post("/actions/search", @options)
    end

    def fetch(action_id)
      @audits = self.class.get("/actions/#{action_id}", @options)
    end

    def create(options)

    end

    def update(options)

    end

  end
end
