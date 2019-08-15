# require 'iAuditor/models/audit'
module IAuditor
  class Audit
    include BaseModules::Methods

    # Retrieving all audits with the given search criteria
    def search(options={})
      @options.merge!(query: options) if options.any?
      @audits = self.class.get("/audits/search", @options)
      @audits.parsed_response
    end

    # Retrieving audit detailed information
    def fetch(audit)
      @audit = self.class.get("/audits/#{audit}", @options)
      @audit.parsed_response
    end

    # Retrieving audit link
    def audit_link(audit)
      @audits = self.class.get("/audits/#{audit}/deep_link", @options)
    end

    # Retrieving audit link
    def audit_web_report_link(audit)
      @audits = self.class.get("/audits/#{audit}/web_report_link", @options)
    end

    # Retrieving audit media
    def audit_media(audit,media)
      @audits = self.class.get("/audits/#{audit}/media/#{media}", @options)
    end

    def export(audit, options={})
      @audit_id = audit
      @options.merge!(query: options) if options.present?
      @export = self.class.post("/audits/#{@audit_id}/export", @options).parsed_response
      @status = export_polling_status
      return @status if @status["status"] == "FAILED"
      
      export_document
    end

    # format. timezone, export_profile
    def start_audit_export(audit,options={})
      @options.merge!(query: options) if options.present?
      @audits = self.class.post("/audits/#{audit}/export", @options)
    end

    # format. timezone, export_profile
    def audit_export(audit, export, file)
      @audits = self.class.get("/audits/#{audit}/exports/#{export}/#{file}", @options)
    end

    private

    def export_polling_status
      @status = self.class.get("/audits/#{@audit_id}/exports/#{@export["id"]}", @options).parsed_response
      export_polling_status if @status["status"] == "IN PROGRESS"
      @status
    end

    def export_document
      file_name = URI.encode(@status["filename"])
      self.class.get("/audits/#{@audit_id}/exports/#{@export["id"]}/#{file_name}", @options).parsed_response
    end
  end
end
