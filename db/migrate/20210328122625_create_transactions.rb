class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.string :bank_account
      t.string :contra_account
      t.string :contra_account_owner
      t.decimal :amount
      t.string :currency
      t.string :funding_type
      t.string :desc

      t.timestamps
    end
  end
end
