# frozen_string_literal: true

require_relative "transfer_mode"
require "ostruct"
require "json"

module Vapi
  class TransferDestinationAssistant
    # @return [Vapi::TransferMode] This is the mode to use for the transfer. Default is `rolling-history`.
    #  - `rolling-history`: This is the default mode. It keeps the entire conversation
    #  history and appends the new assistant's system message on transfer.
    #  Example:
    #  Pre-transfer:
    #  system: assistant1 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  Post-transfer:
    #  system: assistant1 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  system: assistant2 system message
    #  assistant: assistant2 first message (or model generated if firstMessageMode is
    #  set to `assistant-speaks-first-with-model-generated-message`)
    #  - `swap-system-message-in-history`: This replaces the original system message
    #  with the new assistant's system message on transfer.
    #  Example:
    #  Pre-transfer:
    #  system: assistant1 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  Post-transfer:
    #  system: assistant2 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  assistant: assistant2 first message (or model generated if firstMessageMode is
    #  set to `assistant-speaks-first-with-model-generated-message`)
    attr_reader :transfer_mode
    # @return [String] This is the assistant to transfer the call to.
    attr_reader :assistant_name
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

    # @param transfer_mode [Vapi::TransferMode] This is the mode to use for the transfer. Default is `rolling-history`.
    #  - `rolling-history`: This is the default mode. It keeps the entire conversation
    #  history and appends the new assistant's system message on transfer.
    #  Example:
    #  Pre-transfer:
    #  system: assistant1 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  Post-transfer:
    #  system: assistant1 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  system: assistant2 system message
    #  assistant: assistant2 first message (or model generated if firstMessageMode is
    #  set to `assistant-speaks-first-with-model-generated-message`)
    #  - `swap-system-message-in-history`: This replaces the original system message
    #  with the new assistant's system message on transfer.
    #  Example:
    #  Pre-transfer:
    #  system: assistant1 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  Post-transfer:
    #  system: assistant2 system message
    #  assistant: assistant1 first message
    #  user: hey, good morning
    #  assistant: how can i help?
    #  user: i need help with my account
    #  assistant: (destination.message)
    #  assistant: assistant2 first message (or model generated if firstMessageMode is
    #  set to `assistant-speaks-first-with-model-generated-message`)
    # @param assistant_name [String] This is the assistant to transfer the call to.
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
    # @return [Vapi::TransferDestinationAssistant]
    def initialize(assistant_name:, transfer_mode: OMIT, message: OMIT, description: OMIT, additional_properties: nil)
      @transfer_mode = transfer_mode if transfer_mode != OMIT
      @assistant_name = assistant_name
      @message = message if message != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "transferMode": transfer_mode,
        "assistantName": assistant_name,
        "message": message,
        "description": description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransferDestinationAssistant
    #
    # @param json_object [String]
    # @return [Vapi::TransferDestinationAssistant]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      transfer_mode = parsed_json["transferMode"]
      assistant_name = parsed_json["assistantName"]
      message = parsed_json["message"]
      description = parsed_json["description"]
      new(
        transfer_mode: transfer_mode,
        assistant_name: assistant_name,
        message: message,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransferDestinationAssistant to a JSON object
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
      obj.transfer_mode&.is_a?(Vapi::TransferMode) != false || raise("Passed value for field obj.transfer_mode is not the expected type, validation failed.")
      obj.assistant_name.is_a?(String) != false || raise("Passed value for field obj.assistant_name is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
