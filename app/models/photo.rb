class Photo < ActiveRecord::Base
  belongs_to :property
  attachment :file, type: :image

  def self.watermark_image_path
    "#{Rails.root}/app/assets/images/watermark/logo.png"
  end
end
