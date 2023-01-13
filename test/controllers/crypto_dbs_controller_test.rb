require "test_helper"

class CryptoDbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypto_db = crypto_dbs(:one)
  end

  test "should get index" do
    get crypto_dbs_url
    assert_response :success
  end

  test "should get new" do
    get new_crypto_db_url
    assert_response :success
  end

  test "should create crypto_db" do
    assert_difference("CryptoDb.count") do
      post crypto_dbs_url, params: { crypto_db: { amount_owned: @crypto_db.amount_owned, cost_per: @crypto_db.cost_per, symbol: @crypto_db.symbol, user_integer: @crypto_db.user_integer } }
    end

    assert_redirected_to crypto_db_url(CryptoDb.last)
  end

  test "should show crypto_db" do
    get crypto_db_url(@crypto_db)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypto_db_url(@crypto_db)
    assert_response :success
  end

  test "should update crypto_db" do
    patch crypto_db_url(@crypto_db), params: { crypto_db: { amount_owned: @crypto_db.amount_owned, cost_per: @crypto_db.cost_per, symbol: @crypto_db.symbol, user_integer: @crypto_db.user_integer } }
    assert_redirected_to crypto_db_url(@crypto_db)
  end

  test "should destroy crypto_db" do
    assert_difference("CryptoDb.count", -1) do
      delete crypto_db_url(@crypto_db)
    end

    assert_redirected_to crypto_dbs_url
  end
end
