class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file_id
      t.string :caption
      t.references :property, index: true, foreign_key: true
    end
  end
end
