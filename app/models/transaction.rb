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
    # Validate if IBAN of bank_account is correct
    i = 0
    while i<21
      if (i==2 || i==3) || i>=8
          if !numeric?(record.bank_account[i]);
            record.errors.add :bank_account, ': A valid IBAN has two numbers after the first two letters! IBAN format: two letters, two digits, four letters, 14 digits.'
          end
      else 
          if !letter?(record.bank_account[i]);
            record.errors.add :bank_account, ': A valid IBAN starts with two letters! IBAN format: two letters, two digits, four letters, 14 digits. '
          end
      end
      i+=1 
    end 
    # Validate if IBAN of contra_account is correct
    i = 0
    while i<21
      if (i==2 || i==3) || i>=8
          if !numeric?(record.contra_account[i]);
            record.errors.add :contra_account, ': A valid IBAN has two numbers after the first two letters! IBAN format: two letters, two digits, four letters, 14 digits.'
          end
      else 
          if !letter?(record.contra_account[i]);
            record.errors.add :contra_account, ': A valid IBAN starts with two letters! IBAN format: two letters, two digits, four letters, 14 digits. '
          end
      end
      i+=1 
    end 
    # Validate if currency is USD/EUR or €/$
    currency_Valid = false
    case record.currency 
    when "USD", "EUR"
        currency_Valid = true
        
    end
    if !currency_Valid
        record.errors.add :currency, ': Provide a valid currency! Either EUR, USD'
    end
    
  end
end

def letter?(str)
    true if str[/[a-zA-Z]+/]  == str rescue false 
end

def numeric?(str)
    true if Integer(str) rescue false
end


