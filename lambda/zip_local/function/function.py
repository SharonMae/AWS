import json

def handler(event, context):
    # Generate a personalized message using input from the event
    message = 'Hello {} {}!'.format(event['first_name'], event['last_name'])
    info = {
        "Type": "Zip Inline",
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
