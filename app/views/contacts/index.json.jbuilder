json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :business_name, :address, :city, :state, :zip, :phone1, :phone2, :latitude, :longitude
  json.url contact_url(contact, format: :json)
end
