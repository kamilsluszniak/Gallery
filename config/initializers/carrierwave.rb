
 
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  #config.fog_provider = 'aws'
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key => ENV['AWS_SECRET_KEY'],
    :region                => 'eu-central-1'
  } if Rails.env.production?

  # For testing, upload files to local `tmp` folder.
  if Rails.env.production?
    config.storage = :fog
    config.enable_processing = true
  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = true
    config.root = "#{Rails.root}/test/fixtures/files"
  elsif Rails.env.development?
    config.storage = :file
    config.enable_processing = true
  end
  
  
  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

  config.fog_directory    = ENV['AWS_BUCKET']
  #config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  #config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  module CarrierWave
    module MiniMagick
      def quality(percentage)
        manipulate! do |img|
          img.quality(percentage)
          img = yield(img) if block_given?
          img
        end
      end
    end
  end
end