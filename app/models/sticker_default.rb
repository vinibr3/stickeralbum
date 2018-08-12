class StickerDefault < ApplicationRecord
	has_many :spots
	validates :code, format:{with: VALID_NUMERIC_REGEX}, 
					 presence: true, length:{maximum: 255}, uniqueness: true
	validates :name, format:{with: VALID_ALPHA_REGEX},
					 presence: true, length:{maximum: 255}, uniqueness: true

	def self.populate
		sticker_defaults_from_gist_to_json.each do |key, value|
			new_sticker_defautl = StickerDefault.new(code: key, name: value)
			new_sticker_defautl.save
		end
	end

	private 
		def self.sticker_defaults_from_gist
			sticker_defaults_url =  "https://gist.githubusercontent.com/augustohub/"+
									"18f6d6855e63c86f2393b0af4004e17a/raw/fdd916fc18"+
									"8fe453db3a6bf12c0c7b1590f700cc/Stickers%2520(Test)"
			HTTParty.get(sticker_defaults_url, verify: false).body
		end
	   
		# @param freeze_string =
		#  STICKERS = {
		# '001' => "Rick Sanchez",
		# '002' => "Morty Smith",
		# '003' => "Beth Smith",
		#           .
		#           .
		#           .
		#  }.freeze
		#
		# OUTPUT  
		# {"001":"Rick Sanchez",
		# 	"002":"Morty Smith"},
		# 	"003" => "Beth Smith",...}
		def self.pre_process freeze_string
			json_string = freeze_string.remove("STICKERS = ").remove(".freeze")
			json_string = json_string.gsub("=>",":")
			json_string = json_string.gsub("'",'"')
			json_string
		end

		def self.sticker_defaults_from_gist_to_json
			JSON.parse pre_process(sticker_defaults_from_gist)
		end
end