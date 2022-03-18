class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image

  def thumbnail
    return self.image.variant(resize_to_fill: [100, nil])
  end
end
