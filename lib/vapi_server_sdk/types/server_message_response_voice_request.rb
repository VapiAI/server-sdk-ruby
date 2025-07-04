# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ServerMessageResponseVoiceRequest
    # @return [String] DO NOT respond to a `voice-request` webhook with this schema of { data }. This
    #  schema just exists to document what the response should look like. Follow these
    #  instructions:
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
    attr_reader :data
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param data [String] DO NOT respond to a `voice-request` webhook with this schema of { data }. This
    #  schema just exists to document what the response should look like. Follow these
    #  instructions:
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
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageResponseVoiceRequest]
    def initialize(data:, additional_properties: nil)
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "data": data }
    end

    # Deserialize a JSON object to an instance of ServerMessageResponseVoiceRequest
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageResponseVoiceRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      data = parsed_json["data"]
      new(data: data, additional_properties: struct)
    end

    # Serialize an instance of ServerMessageResponseVoiceRequest to a JSON object
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
      obj.data.is_a?(String) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
    end
  end
end
