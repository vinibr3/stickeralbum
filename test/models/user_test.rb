require "test_helper"
class UsersTest < ActiveSupport::TestCase
	def setup
		@user=User.new(email:"user@user.com", username:"username3234",
			           password:"bcript", password_confirmation:"bcript")
	end

	test "User from setup method should be valid" do
		assert @user.valid?, "#{@user.errors.full_messages}"
	end
    
    #email field tests
	test "email should reject invalid addresses" do 
		invalids = %w(user.user.br exampple.com email@dominio u$ser@test.com)
		invalids.each do |invalid|
			@user.email=invalid
			assert_not @user.valid?, "#{invalid.inspect} is invalid"
		end
	end

	test "email should be unique" do 
		duplicate = @user.dup
		@user.save
		duplicate.email = @user.email.upcase 
		duplicate.username = "username3453232" #set other username
		assert_not duplicate.valid?, "#{duplicate.email.inspect} should be unique"
	end

	test "email should be saved as lower case" do
		case_email = "UsEr@UsEr.Com"
		@user.email=case_email
		@user.save
		assert_equal case_email.downcase, @user.reload.email
	end

	#username field tests
	test "username should be present (not blank)" do
		@user.username=""
		assert_not @user.valid?
	end

	test "username should be unique" do
		duplicated_user = @user.dup
		@user.save
		duplicated_user.email = "teste@teste.com" #set other email
		duplicated_user.username = @user.username
		assert_not duplicated_user.valid?, "#{duplicated_user.username.inspect} should be unique"
	end

	#password field tests
	test "password should be bigger then 6" do
		@user.password = @user.password_confirmation = "s"*5
		assert_not @user.valid?
	end

	test "password should be present" do 
		@user.password = @user.password_confirmation = " "*6
		assert_not @user.valid?
	end

	test "should creates user album after create it" do
		@user.save
		assert @user.reload.album
	end

	test "should creates 15 stickers to user after create him" do
		@user.save
		assert_equal 15, @user.reload.stickers.size
	end

end