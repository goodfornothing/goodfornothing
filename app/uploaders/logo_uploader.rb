# encoding: utf-8

class LogoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [300, 300]

  version :thumbnail do
    process :resize_to_fit => [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
