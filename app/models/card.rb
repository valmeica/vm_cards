class Card < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    
    validates_processing_of :image
    validate :image_size_validation
 
  private
    def image_size_validation
      errors[:image] << "should be less than 1500KB" if image.size > 1.5.megabytes
    end
end
