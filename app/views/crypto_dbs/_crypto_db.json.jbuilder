json.extract! crypto_db, :id, :symbol, :user_integer, :cost_per, :amount_owned, :created_at, :updated_at
json.url crypto_db_url(crypto_db, format: :json)
