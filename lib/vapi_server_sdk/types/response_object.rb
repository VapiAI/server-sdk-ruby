# frozen_string_literal: true
require_relative "response_object_status"
require_relative "response_output_message"
require "ostruct"
require "json"

module Vapi
  class ResponseObject
  # @return [String] Unique identifier for this Response
    attr_reader :id
  # @return [String] The object type
    attr_reader :object
  # @return [Float] Unix timestamp (in seconds) of when this Response was created
    attr_reader :created_at
  # @return [Vapi::ResponseObjectStatus] Status of the response
    attr_reader :status
  # @return [String] Error message if the response failed
    attr_reader :error
  # @return [Array<Vapi::ResponseOutputMessage>] Output messages from the model
    attr_reader :output
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for this Response
    # @param object [String] The object type
    # @param created_at [Float] Unix timestamp (in seconds) of when this Response was created
    # @param status [Vapi::ResponseObjectStatus] Status of the response
    # @param error [String] Error message if the response failed
    # @param output [Array<Vapi::ResponseOutputMessage>] Output messages from the model
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ResponseObject]
    def initialize(id:, object:, created_at:, status:, error: OMIT, output:, additional_properties: nil)
      @id = id
      @object = object
      @created_at = created_at
      @status = status
      @error = error if error != OMIT
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "id": id, "object": object, "created_at": created_at, "status": status, "error": error, "output": output }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ResponseObject
    #
    # @param json_object [String] 
    # @return [Vapi::ResponseObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      object = parsed_json["object"]
      created_at = parsed_json["created_at"]
      status = parsed_json["status"]
      error = parsed_json["error"]
      output = parsed_json["output"]&.map do | item |
  item = item.to_json
  Vapi::ResponseOutputMessage.from_json(json_object: item)
end
      new(
        id: id,
        object: object,
        created_at: created_at,
        status: status,
        error: error,
        output: output,
        additional_properties: struct
      )
    end
# Serialize an instance of ResponseObject to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.object.is_a?(String) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.created_at.is_a?(Float) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.status.is_a?(Vapi::ResponseObjectStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.output.is_a?(Array) != false || raise("Passed value for field obj.output is not the expected type, validation failed.")
    end
  end
end