json.array!(@opportunities) do |opportunity|
  json.extract! opportunity, :id, :name, :organisation, :type_id, :identified_at, :source_id, :value, :weighting, :comments
  json.url opportunity_url(opportunity, format: :json)
end