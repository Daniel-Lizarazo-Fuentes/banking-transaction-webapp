require "test_helper"

class TransactionsHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transactions_history = transactions_histories(:one)
  end

  test "should get index" do
    get transactions_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_transactions_history_url
    assert_response :success
  end

  test "should create transactions_history" do
    assert_difference('TransactionsHistory.count') do
      post transactions_histories_url, params: { transactions_history: { amount: @transactions_history.amount, bank_account: @transactions_history.bank_account, contra_account: @transactions_history.contra_account, contra_account_owner: @transactions_history.contra_account_owner, currency: @transactions_history.currency, desc: @transactions_history.desc, funding_type: @transactions_history.funding_type, transaction_date: @transactions_history.transaction_date } }
    end

    assert_redirected_to transactions_history_url(TransactionsHistory.last)
  end

  test "should show transactions_history" do
    get transactions_history_url(@transactions_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_transactions_history_url(@transactions_history)
    assert_response :success
  end

  test "should update transactions_history" do
    patch transactions_history_url(@transactions_history), params: { transactions_history: { amount: @transactions_history.amount, bank_account: @transactions_history.bank_account, contra_account: @transactions_history.contra_account, contra_account_owner: @transactions_history.contra_account_owner, currency: @transactions_history.currency, desc: @transactions_history.desc, funding_type: @transactions_history.funding_type, transaction_date: @transactions_history.transaction_date } }
    assert_redirected_to transactions_history_url(@transactions_history)
  end

  test "should destroy transactions_history" do
    assert_difference('TransactionsHistory.count', -1) do
      delete transactions_history_url(@transactions_history)
    end

    assert_redirected_to transactions_histories_url
  end
end
