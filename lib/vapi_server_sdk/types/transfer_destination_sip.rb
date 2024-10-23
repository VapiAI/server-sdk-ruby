# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TransferDestinationSip
    # @return [String] This is the SIP URI to transfer the call to.
    attr_reader :sip_uri
    # @return [String] This is the message to say before transferring the call to the destination.
    #  If this is not provided and transfer tool messages is not provided, default is
    #  "Transferring the call now".
    #  If set to "", nothing is spoken. This is useful when you want to silently
    #  transfer. This is especially useful when transferring between assistants in a
    #  squad. In this scenario, you likely also want to set
    #  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
    #  for the destination assistant.
    attr_reader :message
    # @return [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param sip_uri [String] This is the SIP URI to transfer the call to.
    # @param message [String] This is the message to say before transferring the call to the destination.
    #  If this is not provided and transfer tool messages is not provided, default is
    #  "Transferring the call now".
    #  If set to "", nothing is spoken. This is useful when you want to silently
    #  transfer. This is especially useful when transferring between assistants in a
    #  squad. In this scenario, you likely also want to set
    #  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
    #  for the destination assistant.
    # @param description [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferDestinationSip]
    def initialize(sip_uri:, message: OMIT, description: OMIT, additional_properties: nil)
      @sip_uri = sip_uri
      @message = message if message != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "sipUri": sip_uri, "message": message, "description": description }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransferDestinationSip
    #
    # @param json_object [String]
    # @return [Vapi::TransferDestinationSip]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      sip_uri = parsed_json["sipUri"]
      message = parsed_json["message"]
      description = parsed_json["description"]
      new(
        sip_uri: sip_uri,
        message: message,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransferDestinationSip to a JSON object
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
      obj.sip_uri.is_a?(String) != false || raise("Passed value for field obj.sip_uri is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
