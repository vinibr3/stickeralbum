class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
    	t.references :album,           foreign_key: true
    	t.references :sticker,         foreign_key: true
    	t.references :sticker_default, foreign_key: true
    end
  end
end
