require "test_helper"

class CardsTest < ActionDispatch::IntegrationTest

  def setup 
    @user = User.create!(username: "test", email: "test@example.com")
    @card = Card.create(word: "word", description: "this word is difficult", points: "10",user: @user)
    @card2 = Card.create(word: "world", description: "this world is difficult", points: "10",user: @user)
  end

  test "should get cards index" do
    get cards_url
    assert_response :success
  end

  test "should get cards list" do
    get cards_url
    assert_template 'cards/index'
    assert_match @card.word, response.body
    assert_match @card2.word, response.body
  end
end
