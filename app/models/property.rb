class Property < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  accepts_attachments_for :photos, append: true
end
