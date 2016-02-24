json.array!(@cards) do |card|
  json.extract! card, :id, :date, :start, :end, :reststart, :restend
  json.url card_url(card, format: :json)
end
