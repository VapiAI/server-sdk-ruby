# frozen_string_literal: true

module Vapi
  # This is the type of the message. "voice-request" is sent when using
  #  `assistant.voice={ "type": "custom-voice" }`.
  #  Here is what the request will look like:
  #  POST https://{assistant.voice.server.url}
  #  Content-Type: application/json
  #  {
  #  "messsage": {
  #  "type": "voice-request",
  #  "text": "Hello, world!",
  #  "sampleRate": 24000,
  #  ...other metadata about the call...
  #  }
  #  }
  #  The expected response is 1-channel 16-bit raw PCM audio at the sample rate
  #  specified in the request. Here is how the response will be piped to the
  #  transport:
  #  ```
  #  response.on('data', (chunk: Buffer) => {
  #  outputStream.write(chunk);
  #  });
  #  ```
  class ServerMessageVoiceRequestType
    VOICE_REQUEST = "voice-request"
  end
end
