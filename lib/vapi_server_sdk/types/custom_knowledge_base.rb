# frozen_string_literal: true

require_relative "server"
require "ostruct"
require "json"

module Vapi
  class CustomKnowledgeBase
    # @return [Vapi::Server] This is where the knowledge base request will be sent.
    #  Request Example:
    #  POST https://{server.url}
    #  Content-Type: application/json
    #  {
    #  "messsage": {
    #  "type": "knowledge-base-request",
    #  "messages": [
    #  {
    #  "role": "user",
    #  "content": "Why is ocean blue?"
    #  }
    #  ],
    #  ...other metadata about the call...
    #  }
    #  }
    #  Response Expected:
    #  ```
    #  {
    #  "message": {
    #  "role": "assistant",
    #  "content": "The ocean is blue because water absorbs everything but blue.",
    #  }, // YOU CAN RETURN THE EXACT RESPONSE TO SPEAK
    #  "documents": [
    #  {
    #  "content": "The ocean is blue primarily because water absorbs colors in
    #  the red part of the light spectrum and scatters the blue light, making it more
    #  visible to our eyes.",
    #  "similarity": 1
    #  },
    #  {
    #  "content": "Blue light is scattered more by the water molecules than other
    #  colors, enhancing the blue appearance of the ocean.",
    #  "similarity": .5
    #  }
    #  ] // OR, YOU CAN RETURN AN ARRAY OF DOCUMENTS THAT WILL BE SENT TO THE MODEL
    #  }
    #  ```
    attr_reader :server
    # @return [String] This is the id of the knowledge base.
    attr_reader :id
    # @return [String] This is the org id of the knowledge base.
    attr_reader :org_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param server [Vapi::Server] This is where the knowledge base request will be sent.
    #  Request Example:
    #  POST https://{server.url}
    #  Content-Type: application/json
    #  {
    #  "messsage": {
    #  "type": "knowledge-base-request",
    #  "messages": [
    #  {
    #  "role": "user",
    #  "content": "Why is ocean blue?"
    #  }
    #  ],
    #  ...other metadata about the call...
    #  }
    #  }
    #  Response Expected:
    #  ```
    #  {
    #  "message": {
    #  "role": "assistant",
    #  "content": "The ocean is blue because water absorbs everything but blue.",
    #  }, // YOU CAN RETURN THE EXACT RESPONSE TO SPEAK
    #  "documents": [
    #  {
    #  "content": "The ocean is blue primarily because water absorbs colors in
    #  the red part of the light spectrum and scatters the blue light, making it more
    #  visible to our eyes.",
    #  "similarity": 1
    #  },
    #  {
    #  "content": "Blue light is scattered more by the water molecules than other
    #  colors, enhancing the blue appearance of the ocean.",
    #  "similarity": .5
    #  }
    #  ] // OR, YOU CAN RETURN AN ARRAY OF DOCUMENTS THAT WILL BE SENT TO THE MODEL
    #  }
    #  ```
    # @param id [String] This is the id of the knowledge base.
    # @param org_id [String] This is the org id of the knowledge base.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomKnowledgeBase]
    def initialize(server:, id:, org_id:, additional_properties: nil)
      @server = server
      @id = id
      @org_id = org_id
      @additional_properties = additional_properties
      @_field_set = { "server": server, "id": id, "orgId": org_id }
    end

    # Deserialize a JSON object to an instance of CustomKnowledgeBase
    #
    # @param json_object [String]
    # @return [Vapi::CustomKnowledgeBase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      new(
        server: server,
        id: id,
        org_id: org_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of CustomKnowledgeBase to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
    end
  end
end
