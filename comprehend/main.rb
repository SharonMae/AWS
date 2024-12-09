require 'aws-sdk-comprehend'
require 'pry'

# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Comprehend/Client.html#detect_dominant_language-instance_method

client = Aws::Comprehend::Client.new
text = "Amazon Web Services (AWS) announced a new set of tools to help developers create AI-powered applications. The announcement was made at AWS re:Invent 2024, held in Las Vegas, Nevada. According to Dr. Jane Smith, a senior VP at AWS, 'These tools will revolutionize how companies leverage machine learning.' The event was attended by over 50,000 professionals from around the world. Many attendees expressed excitement about the new features, with John Doe from TechCorp calling it 'a game-changer for the industry.' Meanwhile, some analysts cautioned that widespread adoption could face challenges due to regulatory hurdles."

resp = client.detect_sentiment({
    text: text,
    language_code: 'en'
})
binding.pry
