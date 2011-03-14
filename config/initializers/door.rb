Door.instance_eval do
  base_uri( Rails.env.production? ? 'localhost:8080' : 'localhost:8111' )
end
