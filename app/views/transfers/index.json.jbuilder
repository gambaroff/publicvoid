json.array!(@transfer) do |transfer|
  json.extract! transfer, 
  json.url transfer_url(transfer, format: :json)
end