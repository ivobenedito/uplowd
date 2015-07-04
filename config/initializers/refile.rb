require 'refile/s3'

aws = {
  access_key_id: 'AKIAIODOEKOHNUIRAFKA',
  secret_access_key: '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',
  region: 'eu-west-1',
  bucket: 'homelovers-development',
}

# test
Refile.host = "//d16cx2malcbma7.cloudfront.net"
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
