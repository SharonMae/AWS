require 'aws-sdk-s3'
require 'openssl'
require 'pry'

# Generate an RSA encryption key
key = OpenSSL::PKey::RSA.new(1024)

# Define the bucket and object key
bucket = 'encrypt-client-shiny-bucket'  # Ensure no trailing spaces here
object_key = 'hello.txt'

# Initialize the S3 encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1, # RSA-OAEP-SHA1 is required for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # Use :v2_and_legacy to support reading V1 encrypted objects
)

# Round-trip an object, encrypting and then decrypting it locally
resp = s3.put_object(bucket: bucket, key: object_key, body: 'handshake')
puts "PUT"
puts resp
resp = s3.get_object(bucket: bucket, key: object_key).body.read
puts "GET WITH KEY"
binding.pry
puts resp
# => 'handshake'

# Attempt to read the encrypted object without the encryption client (shows ciphertext)
resp = Aws::S3::Client.new.get_object(bucket:bucket, key:object_key).body.read
puts "GET WITHOUT KEY"
puts resp 
