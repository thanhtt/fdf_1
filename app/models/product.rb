class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation
  validates :name, :price, :category_id, presence: true,
    length: {maximum: 50}
  validates_numericality_of :price
  validates :image, presence: true

  private
  def image_size_validation
    errors[:image] << In18.t("max_size_image") if image.size >
      0.5.megabytes
  end
end
