class Transaction < ApplicationRecord
  # All entries except desc should be filled in:
  validates :currency, :bank_account, :contra_account, :contra_account_owner, :amount, :funding_type,
            presence: true
  # Only numbers:
  validates :amount, numericality: true

  # Specific lenght
  validates :bank_account, length: { is: 22 }
  validates :contra_account, length: { is: 22 }

  validates_with AccountFormatValidator
end

class AccountFormatValidator < ActiveModel::Validator
  # Could've also used splits
  def validate(record)
    
    i = 0
    while i<22
      if (i==2 || i==3) || i>=7
          if !numeric?(record.bank_account[i]);
            record.errors.add :base, 'A valid IBAN has two numbers after the first two letters! IBAN format: two letters, two digits, four letters, 14 digits.'
          end
      else 
          if !letter?(record.bank_account[i]);
            record.errors.add :base, 'A valid IBAN starts with two letters! IBAN format: two letters, two digits, four letters, 14 digits. '
          end
      end
      i+=1 
    end 
  end
end

def letter?(str)
  str.match?(/[[:alpha:]]/)
end

def numeric?(str)
  str.match?(/[[:digit:]]/)
end
