json.extract! transactions_history, :id, :transaction_date, :bank_account, :contra_account, :contra_account_owner, :amount, :currency, :funding_type, :desc, :created_at, :updated_at
json.url transactions_history_url(transactions_history, format: :json)
