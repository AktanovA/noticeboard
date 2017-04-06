class Article < ApplicationRecord
  mount_uploaders :images, ImageUploader
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 25}
  belongs_to :user
end
