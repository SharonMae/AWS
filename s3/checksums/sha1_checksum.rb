require 'digest'
require 'base64'

# Calculate SHA-1 checksum of the file and get it as a hexadecimal string
checksum = Digest::SHA1.file("myfile.txt").hexdigest

# Encode the checksum in Base64
enc = Base64.encode64([checksum].pack("H*")).force_encoding('UTF-8')
puts enc
