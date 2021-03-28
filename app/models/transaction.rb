class Transaction < ApplicationRecord
# All entries except desc should be filled in:
    validates :currency,  :bank_account,   :contra_account, :contra_account_owner,   :amount,  :funding_type,  presence: true
# Only numbers:
validates :amount, numericality: true

# Specific lenght
validates :bank_account, length: { is: 22 }
validates :contra_account, length: { is: 22 }



end
