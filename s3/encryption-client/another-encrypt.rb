# Require necessary libraries
require 'aws-sdk-s3'  # AWS SDK for interacting with S3
require 'openssl'     # OpenSSL for generating encryption keys
require 'pry'         # Pry for interactive debugging

# Step 1: Generate an RSA encryption key
# An RSA key of size 1024 bits is generated for encryption purposes.
key = OpenSSL::PKey::RSA.new(1024)

# Step 2: Define the S3 bucket and object key (filename)
# The bucket name and object key (filename) to store the file in S3.
bucket = 'encrypt-client-shiny-bucket'  # Ensure there are no trailing spaces
object_key = 'hello.txt'

# Step 3: Initialize the S3 encryption client
# The encryption client is configured with the following:
# - RSA key for encryption (encryption_key).
# - RSA-OAEP-SHA1 wrapping schema for asymmetric key encryption (key_wrap_schema).
# - AES GCM No Padding for content encryption (content_encryption_schema).
# - Use :v2 profile for modern encryption; :v2_and_legacy can support older encryption methods too.
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1,       # Required for asymmetric key encryption
  content_encryption_schema: :aes_gcm_no_padding,  # AES encryption scheme
  security_profile: :v2                 # Use the V2 security profile for encryption
)

# Step 4: Put an object into the S3 bucket with encryption (Encrypt and Upload)
# This puts a file with the content 'handshake' into the S3 bucket.
resp = s3.put_object(bucket: bucket, key: object_key, body: 'handshake')

# Debugging: Use Pry to inspect the response of the put_object call
# This allows you to interactively inspect the state of the variables and response.
binding.pry

# Output confirmation that the PUT request was successful
puts "PUT: Object uploaded to S3"
puts resp  # Print the response from the put_object call

# Step 5: Get the object back from S3 with encryption (Decrypt and Retrieve)
# The object is retrieved securely using the encryption client, and decrypted locally.
resp = s3.get_object(bucket: bucket, key: object_key).body.read
puts "GET WITH KEY: Decrypted object"
puts resp  # This should print 'handshake'

# Step 6: Read the encrypted object without the encryption client
# This simulates a scenario where you try to read the object without using the encryption client.
# Since the object is encrypted, the result will be encrypted (ciphertext).
plaintext_client = Aws::S3::Client.new
puts "GET WITHOUT KEY: Ciphertext (encrypted data)"
puts plaintext_client.get_object(bucket: bucket, key: object_key).body.read
# The data printed here will be in an encrypted form because we're not using the encryption client.

# Step 7: Conclusion
# At this point, the script shows the encryption and decryption process, as well as
# what happens when trying to access encrypted data without the correct client.