require "application_system_test_case"

class TransactionsHistoriesTest < ApplicationSystemTestCase
  setup do
    @transactions_history = transactions_histories(:one)
  end

  test "visiting the index" do
    visit transactions_histories_url
    assert_selector "h1", text: "Transactions Histories"
  end

  test "creating a Transactions history" do
    visit transactions_histories_url
    click_on "New Transactions History"

    fill_in "Amount", with: @transactions_history.amount
    fill_in "Bank account", with: @transactions_history.bank_account
    fill_in "Contra account", with: @transactions_history.contra_account
    fill_in "Contra account owner", with: @transactions_history.contra_account_owner
    fill_in "Currency", with: @transactions_history.currency
    fill_in "Desc", with: @transactions_history.desc
    fill_in "Funding type", with: @transactions_history.funding_type
    fill_in "Transaction date", with: @transactions_history.transaction_date
    click_on "Create Transactions history"

    assert_text "Transactions history was successfully created"
    click_on "Back"
  end

  test "updating a Transactions history" do
    visit transactions_histories_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @transactions_history.amount
    fill_in "Bank account", with: @transactions_history.bank_account
    fill_in "Contra account", with: @transactions_history.contra_account
    fill_in "Contra account owner", with: @transactions_history.contra_account_owner
    fill_in "Currency", with: @transactions_history.currency
    fill_in "Desc", with: @transactions_history.desc
    fill_in "Funding type", with: @transactions_history.funding_type
    fill_in "Transaction date", with: @transactions_history.transaction_date
    click_on "Update Transactions history"

    assert_text "Transactions history was successfully updated"
    click_on "Back"
  end

  test "destroying a Transactions history" do
    visit transactions_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transactions history was successfully destroyed"
  end
end
