# encoding: utf-8

class BirdimageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [256,256]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
