json.array!(@asset_transfer) do |asset_transfer|
  json.extract! asset_transfer, 
  json.url asset_transfers_url(asset_transfer, format: :json)
end