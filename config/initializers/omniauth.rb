Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :facebook, '419059044832080', '0feebad62a0a48e811be55fcc252a0e1'
  
end