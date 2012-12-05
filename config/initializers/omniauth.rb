Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == "development"
  	provider :facebook, '419059044832080', '0feebad62a0a48e811be55fcc252a0e1', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }
  elsif Rails.env == "production"
	provider :facebook, '317364371704303', '98508ee8883ac7e5996f856be00ad3d7', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }
  end
end