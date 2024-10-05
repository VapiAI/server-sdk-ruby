# frozen_string_literal: true

require_relative "client_message_speech_update_status"
require_relative "client_message_speech_update_role"
require "ostruct"
require "json"

module Vapi
  class ClientMessageSpeechUpdate
    # @return [String] This is the type of the message. "speech-update" is sent whenever assistant or
    #  user start or stop speaking.
    attr_reader :type
    # @return [Vapi::ClientMessageSpeechUpdateStatus] This is the status of the speech update.
    attr_reader :status
    # @return [Vapi::ClientMessageSpeechUpdateRole] This is the role which the speech update is for.
    attr_reader :role
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "speech-update" is sent whenever assistant or
    #  user start or stop speaking.
    # @param status [Vapi::ClientMessageSpeechUpdateStatus] This is the status of the speech update.
    # @param role [Vapi::ClientMessageSpeechUpdateRole] This is the role which the speech update is for.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageSpeechUpdate]
    def initialize(type:, status:, role:, additional_properties: nil)
      @type = type
      @status = status
      @role = role
      @additional_properties = additional_properties
      @_field_set = { "type": type, "status": status, "role": role }
    end

    # Deserialize a JSON object to an instance of ClientMessageSpeechUpdate
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageSpeechUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      status = parsed_json["status"]
      role = parsed_json["role"]
      new(
        type: type,
        status: status,
        role: role,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageSpeechUpdate to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.status.is_a?(Vapi::ClientMessageSpeechUpdateStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::ClientMessageSpeechUpdateRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
    end
  end
end
