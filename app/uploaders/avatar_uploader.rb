# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [200,200]

  version :thumbnail do
    process :resize_to_fit => [50,50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
