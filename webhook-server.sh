#!/bin/bash
# Run with: ./webhook-server.sh

# Run a simple web server to listen for GitHub POST requests
while true; do
  echo "Listening for webhooks..."
  echo -e "HTTP/1.1 200 OK\n\nWebhook received!" | nc -l -p 9000 -q 1

  # Run your handler script when a webhook is received
  ./webhook-handler.sh
done

# 1. Go to your GitHub repository.
# 2. Click on Settings > Webhooks > Add webhook.
# 3. In the Payload URL field, enter the public URL or IP address of your server, and include the port number (e.g., http://44.202.6.228:9000).
# 4. Set the Content type to application/json.
# 5. Select which events to trigger (e.g., Push events).
# 6. Click Add webhook
