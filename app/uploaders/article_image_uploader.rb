# encoding: utf-8

class ArticleImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [700,nil]

  version :thumbnail do
    process :resize_to_fit => [330,220]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
