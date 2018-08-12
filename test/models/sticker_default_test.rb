require 'test_helper'
class StickerDefaultTest < ActiveSupport::TestCase
	def setup
		@user = sticker_defaults(:bryam)
	end

	test "should be valid sticker instance" do
		assert @user.valid?
	end

	# Test code variable
	test "should be code string numeric only" do
		invalid_codes = %w(code1 dfdf pfog#dsf code-code 234-code !@#%^$)
		invalid_codes.each do |invalid_code| 
			@user.code = invalid_code
			assert_not @user.valid?
		end
	end
	test "should be code present" do
		@user.code = " "
		assert_not @user.valid?
	end
	test "should be code unique" do
		duplicated_user = @user.dup
		duplicated_user.name= "Adam Smith" # change name, must be unique
		@user.save
		assert_not duplicated_user.valid?, "#{duplicated_user.code.inspect} should be unique"
	end

	# Test name variable
	test "should be name string alpha" do
		invalid_names = %w(83724 3243ndfd323 @!#^&"';" nfd343!@&65 nFDs-WER )
		invalid_names.each do |invalid_name|
			@user.name = invalid_name
			assert_not @user.valid?
		end
	end
	test "should be name present" do
		@user.name = " "
		assert_not @user.valid?
	end
	test "should be name unique" do
		duplicated_user = @user.dup
		duplicated_user.code = "9384" # change code, must be unique
		@user.save
		assert_not duplicated_user.valid?, "#{duplicated_user.name.inspect} should be unique"
	end

	# Test populate method
	test "should populate sticker_default" do
		assert StickerDefault.populate
	end
end