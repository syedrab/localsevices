json.array!(@service_areas) do |service_area|
  json.extract! service_area, :id
  json.url service_area_url(service_area, format: :json)
end
