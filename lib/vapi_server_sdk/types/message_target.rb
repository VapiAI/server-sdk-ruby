# frozen_string_literal: true

require_relative "message_target_role"
require "ostruct"
require "json"

module Vapi
  class MessageTarget
    # @return [Vapi::MessageTargetRole] This is the role of the message to target.
    #  If not specified, will find the position in the message history ignoring role
    #  (effectively `any`).
    attr_reader :role
    # @return [Float] This is the position of the message to target.
    #  - Negative numbers: Count from end (-1 = most recent, -2 = second most recent)
    #  - 0: First/oldest message in history
    #  - Positive numbers: Specific position (0-indexed from start)
    #  @default -1 (most recent message)
    attr_reader :position
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::MessageTargetRole] This is the role of the message to target.
    #  If not specified, will find the position in the message history ignoring role
    #  (effectively `any`).
    # @param position [Float] This is the position of the message to target.
    #  - Negative numbers: Count from end (-1 = most recent, -2 = second most recent)
    #  - 0: First/oldest message in history
    #  - Positive numbers: Specific position (0-indexed from start)
    #  @default -1 (most recent message)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::MessageTarget]
    def initialize(role: OMIT, position: OMIT, additional_properties: nil)
      @role = role if role != OMIT
      @position = position if position != OMIT
      @additional_properties = additional_properties
      @_field_set = { "role": role, "position": position }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MessageTarget
    #
    # @param json_object [String]
    # @return [Vapi::MessageTarget]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      position = parsed_json["position"]
      new(
        role: role,
        position: position,
        additional_properties: struct
      )
    end

    # Serialize an instance of MessageTarget to a JSON object
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
      obj.role&.is_a?(Vapi::MessageTargetRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.position&.is_a?(Float) != false || raise("Passed value for field obj.position is not the expected type, validation failed.")
    end
  end
end
