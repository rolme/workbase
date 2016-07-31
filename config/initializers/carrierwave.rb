require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development?
    config.storage = :file
  elsif Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.fog_provider = 'fog/aws'
    config.storage = :fog

    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['BUCKETEER_AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY'],
    }

    config.cache_dir = "#{Rails.root}/tmp/uploads"

    config.fog_directory  = ENV['BUCKETEER_BUCKET_NAME']
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
end
