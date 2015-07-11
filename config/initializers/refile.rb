require 'refile/s3'

if Rails.env.production?
  aws = {
    access_key_id: Rails.application.secrets.aws_access_key_id,
    secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: Rails.application.secrets.aws_region,
    bucket: Rails.application.secrets.aws_bucket
  }

  Refile.host = '//d16cx2malcbma7.cloudfront.net'

  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end

#
# Custom Image Processor
#

class CustomImageProcessor < Refile::MiniMagick

  def watermark(img, width, height, gravity = 'Center')
    img = fill(img, width, height, gravity)

    img.combine_options do |c|
      c.gravity 'Center'
      c.draw %Q{image Over 0,0 0,0 "#{Photo.watermark_image_path}"}
    end
  end

end

[:watermark].each do |name|
  Refile.processor(name, CustomImageProcessor.new(name))
end
