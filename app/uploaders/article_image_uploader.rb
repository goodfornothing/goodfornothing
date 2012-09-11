# encoding: utf-8

class ArticleImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [600,nil]

  version :thumbnail do
    process :resize_to_fill => [185,110]
  end
  
  version :panel do 
    process :resize_to_fill => [260,174] 
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
