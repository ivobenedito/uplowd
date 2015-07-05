class Photo < ActiveRecord::Base
  belongs_to :property
  attachment :file, type: :image
end
