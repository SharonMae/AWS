require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'us-west-2'  # Change this to match the actual region of your bucket

# Initialize the S3 client with the correct region
client = Aws::S3::Client.new(region: region)

# Create the S3 bucket if necessary (comment out if the bucket already exists)
resp = client.create_bucket({
  bucket: bucket_name, 
  create_bucket_configuration: {
    location_constraint: region
  }
})

number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

number_of_files.times.each do |i|
    puts "i: #{i}"
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}"

    File.open(output_path, "w") do |f|
        f.write(SecureRandom.uuid)
    end 

    File.open(output_path, 'rb') do |f|
      client.put_object(
        bucket: bucket_name, 
        key: filename, 
        body: f
      )
    end
end

