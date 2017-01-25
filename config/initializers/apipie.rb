Apipie.configure do |config|
  config.app_name                = "PageIndexerApp"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/api/docs"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info = "API Documentation"
end
