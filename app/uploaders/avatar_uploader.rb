# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [120,120]

  version :compact do
    process :resize_to_fill => [60,60]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
