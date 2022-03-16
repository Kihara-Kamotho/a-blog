class Post < ApplicationRecord
  has_many :comments
  has_rich_text :description
  has_one_attached :image

  def thumbnail
    return self.image.variant(resize_to_fill: [100, nil])
  end
end
