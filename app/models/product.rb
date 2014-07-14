class Product < ActiveRecord::Base

	mount_uploader :image, PhotoUploader
end
