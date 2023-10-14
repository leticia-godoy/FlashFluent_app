require 'test_helper'

class CardTest < ActiveSupport::TestCase

    def setup  
        @user = User.create!(username: "test", email:"email@test.com")
        @card = @user.cards.build(word: "width", description: "The architect carefully measured the width of the bedroom", points: "15")
    end

    test "card should be valid" do
        assert @card.valid?
    end

    test "word should be present" do
        @card.word = ""
        assert_not @card.valid?
    end

    test "desc should be present" do
        @card.description = ""
        assert_not @card.valid?
    end

    test "pts should be present" do
        @card.points = ""
        assert_not @card.valid?
    end

    test "desc should be more than 5 characters" do
        @card.description = "a" * 3
        assert_not @card.valid?
    end

    test "desc should be less than 5 characters" do
        @card.description = "a" * 501
        assert_not @card.valid?
    end
end