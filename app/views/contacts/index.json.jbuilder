json.array!(@contacts) do |contact|
  json.extract! contact, :id, :fullname, :phonenumber, :address, :description
  json.url contact_url(contact, format: :json)
end
