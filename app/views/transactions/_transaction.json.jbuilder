json.extract! transaction, :id, :transaction_date, :bank_account, :contra_account, :contra_account_owner, :amount, :currency, :funding_type, :desc, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
