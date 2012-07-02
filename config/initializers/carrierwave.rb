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
      :aws_access_key_id      => 'AKIAIWNYFKN2YSPT7VJA', 
      :aws_secret_access_key  => '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', 
    } 
    config.fog_directory  = 'goodfornothing' 
    config.fog_public     = false
  end
end