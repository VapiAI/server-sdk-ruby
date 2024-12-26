# frozen_string_literal: true

require_relative "server"
require "ostruct"
require "json"

module Vapi
  class CustomTranscriber
    # @return [Vapi::Server] This is where the transcription request will be sent.
    #  Usage:
    #  1. Vapi will initiate a websocket connection with `server.url`.
    #  2. Vapi will send an initial text frame with the sample rate. Format:
    #  ```
    #  {
    #  "type": "start",
    #  "encoding": "linear16", // 16-bit raw PCM format
    #  "container": "raw",
    #  "sampleRate": {{sampleRate}},
    #  "channels": 2 // customer is channel 0, assistant is channel 1
    #  }
    #  ```
    #  3. Vapi will send the audio data in 16-bit raw PCM format as binary frames.
    #  4. You can read the messages something like this:
    #  ```
    #  ws.on('message', (data, isBinary) => {
    #  if (isBinary) {
    #  pcmBuffer = Buffer.concat([pcmBuffer, data]);
    #  console.log(`Received PCM data, buffer size: ${pcmBuffer.length}`);
    #  } else {
    #  console.log('Received message:', JSON.parse(data.toString()));
    #  }
    #  });
    #  ```
    #  5. You will respond with transcriptions as you have them. Format:
    #  ```
    #  {
    #  "type": "transcriber-response",
    #  "transcription": "Hello, world!",
    #  "channel": "customer" | "assistant"
    #  }
    #  ```
    attr_reader :server
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param server [Vapi::Server] This is where the transcription request will be sent.
    #  Usage:
    #  1. Vapi will initiate a websocket connection with `server.url`.
    #  2. Vapi will send an initial text frame with the sample rate. Format:
    #  ```
    #  {
    #  "type": "start",
    #  "encoding": "linear16", // 16-bit raw PCM format
    #  "container": "raw",
    #  "sampleRate": {{sampleRate}},
    #  "channels": 2 // customer is channel 0, assistant is channel 1
    #  }
    #  ```
    #  3. Vapi will send the audio data in 16-bit raw PCM format as binary frames.
    #  4. You can read the messages something like this:
    #  ```
    #  ws.on('message', (data, isBinary) => {
    #  if (isBinary) {
    #  pcmBuffer = Buffer.concat([pcmBuffer, data]);
    #  console.log(`Received PCM data, buffer size: ${pcmBuffer.length}`);
    #  } else {
    #  console.log('Received message:', JSON.parse(data.toString()));
    #  }
    #  });
    #  ```
    #  5. You will respond with transcriptions as you have them. Format:
    #  ```
    #  {
    #  "type": "transcriber-response",
    #  "transcription": "Hello, world!",
    #  "channel": "customer" | "assistant"
    #  }
    #  ```
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomTranscriber]
    def initialize(server:, additional_properties: nil)
      @server = server
      @additional_properties = additional_properties
      @_field_set = { "server": server }
    end

    # Deserialize a JSON object to an instance of CustomTranscriber
    #
    # @param json_object [String]
    # @return [Vapi::CustomTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      new(server: server, additional_properties: struct)
    end

    # Serialize an instance of CustomTranscriber to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      Vapi::Server.validate_raw(obj: obj.server)
    end
  end
end
