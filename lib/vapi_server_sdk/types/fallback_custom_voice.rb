# frozen_string_literal: true

require_relative "server"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackCustomVoice
    # @return [Vapi::Server] This is where the voice request will be sent.
    #  Request Example:
    #  POST https://{server.url}
    #  Content-Type: application/json
    #  {
    #  "message": {
    #  "type": "voice-request",
    #  "text": "Hello, world!",
    #  "sampleRate": 24000,
    #  ...other metadata about the call...
    #  }
    #  }
    #  Response Expected: 1-channel 16-bit raw PCM audio at the sample rate specified
    #  in the request. Here is how the response will be piped to the transport:
    #  ```
    #  response.on('data', (chunk: Buffer) => {
    #  outputStream.write(chunk);
    #  });
    #  ```
    attr_reader :server
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param server [Vapi::Server] This is where the voice request will be sent.
    #  Request Example:
    #  POST https://{server.url}
    #  Content-Type: application/json
    #  {
    #  "message": {
    #  "type": "voice-request",
    #  "text": "Hello, world!",
    #  "sampleRate": 24000,
    #  ...other metadata about the call...
    #  }
    #  }
    #  Response Expected: 1-channel 16-bit raw PCM audio at the sample rate specified
    #  in the request. Here is how the response will be piped to the transport:
    #  ```
    #  response.on('data', (chunk: Buffer) => {
    #  outputStream.write(chunk);
    #  });
    #  ```
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackCustomVoice]
    def initialize(server:, chunk_plan: OMIT, additional_properties: nil)
      @server = server
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "server": server, "chunkPlan": chunk_plan }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackCustomVoice
    #
    # @param json_object [String]
    # @return [Vapi::FallbackCustomVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        server: server,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackCustomVoice to a JSON object
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
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
