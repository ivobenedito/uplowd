class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file_id
      t.string :caption
    end
  end
end
