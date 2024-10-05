# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TransferDestinationStep
    # @return [String]
    attr_reader :type
    # @return [String] This is the step to transfer to.
    attr_reader :step_name
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

    # @param type [String]
    # @param step_name [String] This is the step to transfer to.
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
    # @return [Vapi::TransferDestinationStep]
    def initialize(type:, step_name:, message: OMIT, description: OMIT, additional_properties: nil)
      @type = type
      @step_name = step_name
      @message = message if message != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "stepName": step_name,
        "message": message,
        "description": description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransferDestinationStep
    #
    # @param json_object [String]
    # @return [Vapi::TransferDestinationStep]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      step_name = parsed_json["stepName"]
      message = parsed_json["message"]
      description = parsed_json["description"]
      new(
        type: type,
        step_name: step_name,
        message: message,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransferDestinationStep to a JSON object
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
      obj.step_name.is_a?(String) != false || raise("Passed value for field obj.step_name is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
