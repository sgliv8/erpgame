json.array!(@records) do |record|
  json.extract! record, :id, :round, :begin_cash, :user_id
  json.url record_url(record, format: :json)
end
