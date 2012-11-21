# encoding: utf-8

class IconUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	version :large do 
		process :resize_to_fit => [185,nil]
	end

	version :small do
    process :resize_to_fit => [75,55]
  end

	version :medium do
    process :resize_to_fit => [nil,110]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
