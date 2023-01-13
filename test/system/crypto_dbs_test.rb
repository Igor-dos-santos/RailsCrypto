require "application_system_test_case"

class CryptoDbsTest < ApplicationSystemTestCase
  setup do
    @crypto_db = crypto_dbs(:one)
  end

  test "visiting the index" do
    visit crypto_dbs_url
    assert_selector "h1", text: "Crypto dbs"
  end

  test "should create crypto db" do
    visit crypto_dbs_url
    click_on "New crypto db"

    fill_in "Amount owned", with: @crypto_db.amount_owned
    fill_in "Cost per", with: @crypto_db.cost_per
    fill_in "Symbol", with: @crypto_db.symbol
    fill_in "User integer", with: @crypto_db.user_integer
    click_on "Create Crypto db"

    assert_text "Crypto db was successfully created"
    click_on "Back"
  end

  test "should update Crypto db" do
    visit crypto_db_url(@crypto_db)
    click_on "Edit this crypto db", match: :first

    fill_in "Amount owned", with: @crypto_db.amount_owned
    fill_in "Cost per", with: @crypto_db.cost_per
    fill_in "Symbol", with: @crypto_db.symbol
    fill_in "User integer", with: @crypto_db.user_integer
    click_on "Update Crypto db"

    assert_text "Crypto db was successfully updated"
    click_on "Back"
  end

  test "should destroy Crypto db" do
    visit crypto_db_url(@crypto_db)
    click_on "Destroy this crypto db", match: :first

    assert_text "Crypto db was successfully destroyed"
  end
end
