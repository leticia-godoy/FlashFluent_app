require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup  
        @user = User.new(username: "test", email: "test@test.com", points: "15")
    end

    test "user should be valid" do
        assert @user.valid?
    end

    test "name should be present" do
        @user.username = ""
        assert_not @user.valid?
    end

    test "name should be less than 30 characters" do
        @user.username = "a" * 31
        assert_not @user.valid?
    end

    test "email should be present" do
        @user.email = ""
        assert_not @user.valid?
    end

    test "email should not be too long" do
        @user.email = "a" * 250 + "@test.com"
        assert_not @user.valid?
    end

    test "email should accept correct format" do
        valid_emails = %w[user@example.com TEST@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
        valid_emails.each do |valids|
        @user.email = valids
        assert @user.valid?, "#{valids.inspect} should be valid"
        end
    end
    
    test "should reject invalid addresses" do
        invalid_emails = %w[test@example test@example,com test.name@gmail. joe@bar+foo.com]
        invalid_emails.each do |invalids|
        @user.email = invalids
        assert_not @user.valid?, "#{invalids.inspect} should be invalid"
        end
    end 
    
    test "email should be unique and case insensitive" do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save
        assert_not duplicate_user.valid?
    end
end