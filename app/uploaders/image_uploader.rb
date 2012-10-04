# encoding: utf-8

require 'digest/md5'

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    "/assets/" + [version_name, "default.gif"].compact.join('_')
  end

  def scale(width, height)
    # do something
  end

  process :resize_to_fit => [640,nil]
  
  version :thumb do
      process :resize_to_fill => [100, 100]
  end

  version :large do
    process :resize_to_fit => [640, nil]
  end

  version :medium do
    process :resize_to_fill => [384, 214]
  end

  version :mobile do
    process :resize_to_fill => [300, 170]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
    digest = Digest::MD5.hexdigest(Time.current.to_i.to_s)
    "#{digest[0..15]}_#{original_filename}"
  end
  
  def as_json(options = nil)
    {
      :url => url
    }.merge(
      ImageSizes::General.styles.inject({}) do |h, general_image_style|
        h.merge!(general_image_style.to_sym => {
          :url => versions[general_image_style].url,
          :width => ImageSizes::General.styles_and_sizes[general_image_style][0],
          :height => ImageSizes::General.styles_and_sizes[general_image_style][1]
        })
      end
    )
  end

end