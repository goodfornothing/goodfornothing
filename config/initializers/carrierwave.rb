yaml_file = File.join(Rails.root, "config", "carrierwave.yml")
carrierwave_info = YAML.load_file(yaml_file)[Rails.env.to_s]

if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = { 
      :provider               => 'AWS', 
      :aws_access_key_id      => carrierwave_info['s3_key_id'], 
      :aws_secret_access_key  => carrierwave_info['s3_secret_key'], 
    } 
    config.fog_directory  = carrierwave_info['bucket']
    config.fog_public     = false
  end
end