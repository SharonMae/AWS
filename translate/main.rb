require 'aws-sdk-translate'
require 'pry'

client = Aws::Translate::Client.new

text = "Amazon Web Services (AWS) announced a new set of tools to help developers create AI-powered applications. The announcement was made at AWS re:Invent 2024, held in Las Vegas, Nevada. According to Dr. Jane Smith, a senior VP at AWS, 'These tools will revolutionize how companies leverage machine learning.' The event was attended by over 50,000 professionals from around the world. Many attendees expressed excitement about the new features, with John Doe from TechCorp calling it 'a game-changer for the industry.' Meanwhile, some analysts cautioned that widespread adoption could face challenges due to regulatory hurdles."

resp = client.translate_text({
  text: text, # required
  source_language_code: "en", # required
  target_language_code: "es" # required
})
puts resp.translated_text
# binding.pry
