# frozen_string_literal: true
require_relative "server"
require_relative "fallback_transcriber_plan"
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
  # @return [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
#  voice provider fails.
    attr_reader :fallback_plan
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
    # @param fallback_plan [Vapi::FallbackTranscriberPlan] This is the plan for voice provider fallbacks in the event that the primary
#  voice provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomTranscriber]
    def initialize(server:, fallback_plan: OMIT, additional_properties: nil)
      @server = server
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "server": server, "fallbackPlan": fallback_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomTranscriber
    #
    # @param json_object [String] 
    # @return [Vapi::CustomTranscriber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["server"].nil?
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      else
        server = nil
      end
      unless parsed_json["fallbackPlan"].nil?
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::FallbackTranscriberPlan.from_json(json_object: fallback_plan)
      else
        fallback_plan = nil
      end
      new(
        server: server,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomTranscriber to a JSON object
    #
    # @return [String]
    def to_json
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
      obj.fallback_plan.nil? || Vapi::FallbackTranscriberPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end