import json
from faker import Faker

def handler(event, context):
    # Generate a personalized message using input from the event
    fake = Faker()
    message = 'Hello {}!'.format(fake.name())
    info = {
        "Type": "Container Example",
        "Version": 1,
    }

    # Convert into a JSON string
    info_json = json.dumps(info)

    # Print the JSON string
    print(info_json)

    # Return the message as a response
    return {
        'message': message
    }
