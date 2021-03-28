class CreateTransactionsHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions_histories do |t|
      t.date :transaction_date
      t.string :bank_account
      t.string :contra_account
      t.string :contra_account_owner
      t.bigint :amount
      t.string :currency
      t.string :funding_type
      t.string :desc

      t.timestamps
    end
  end
end
