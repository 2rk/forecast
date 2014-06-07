json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :name, :organisation, :type_id, :date_received, :source_id, :value, :weighting, :comments
  json.url opportunity_url(opportunity, format: :json)
end
