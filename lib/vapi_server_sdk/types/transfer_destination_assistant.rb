# frozen_string_literal: true
require_relative "transfer_destination_assistant_message"
require_relative "transfer_mode"
require "ostruct"
require "json"

module Vapi
  class TransferDestinationAssistant
  # @return [Vapi::TransferDestinationAssistantMessage] This is spoken to the customer before connecting them to the destination.
#  Usage:
#  - If this is not provided and transfer tool messages is not provided, default is
#  "Transferring the call now".
#  - If set to "", nothing is spoken. This is useful when you want to silently
#  transfer. This is especially useful when transferring between assistants in a
#  squad. In this scenario, you likely also want to set
#  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
#  for the destination assistant.
#  This accepts a string or a ToolMessageStart class. Latter is useful if you want
#  to specify multiple messages for different languages through the `contents`
#  field.
    attr_reader :message
  # @return [Vapi::TransferMode] This is the mode to use for the transfer. Defaults to `rolling-history`.
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
#  assistant: assistant2 first message (or model generated if firstMessageMode
#  is set to `assistant-speaks-first-with-model-generated-message`)
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
#  assistant: assistant2 first message (or model generated if firstMessageMode
#  is set to `assistant-speaks-first-with-model-generated-message`)
#  - `delete-history`: This deletes the entire conversation history on transfer.
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
#  assistant: assistant2 first message
#  user: Yes, please
#  assistant: how can i help?
#  user: i need help with my account
#  - `swap-system-message-in-history-and-remove-transfer-tool-messages`: This
#  replaces the original system message with the new assistant's system message on
#  transfer and removes transfer tool messages from conversation history sent to
#  the LLM.
#  Example:
#  Pre-transfer:
#  system: assistant1 system message
#  assistant: assistant1 first message
#  user: hey, good morning
#  assistant: how can i help?
#  user: i need help with my account
#  transfer-tool
#  transfer-tool-result
#  assistant: (destination.message)
#  Post-transfer:
#  system: assistant2 system message
#  assistant: assistant1 first message
#  user: hey, good morning
#  assistant: how can i help?
#  user: i need help with my account
#  assistant: (destination.message)
#  assistant: assistant2 first message (or model generated if firstMessageMode
#  is set to `assistant-speaks-first-with-model-generated-message`)
#  @default 'rolling-history'
    attr_reader :transfer_mode
  # @return [String] This is the assistant to transfer the call to.
    attr_reader :assistant_name
  # @return [String] This is the description of the destination, used by the AI to choose when and
#  how to transfer the call.
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::TransferDestinationAssistantMessage] This is spoken to the customer before connecting them to the destination.
#  Usage:
#  - If this is not provided and transfer tool messages is not provided, default is
#  "Transferring the call now".
#  - If set to "", nothing is spoken. This is useful when you want to silently
#  transfer. This is especially useful when transferring between assistants in a
#  squad. In this scenario, you likely also want to set
#  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
#  for the destination assistant.
#  This accepts a string or a ToolMessageStart class. Latter is useful if you want
#  to specify multiple messages for different languages through the `contents`
#  field.
    # @param transfer_mode [Vapi::TransferMode] This is the mode to use for the transfer. Defaults to `rolling-history`.
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
#  assistant: assistant2 first message (or model generated if firstMessageMode
#  is set to `assistant-speaks-first-with-model-generated-message`)
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
#  assistant: assistant2 first message (or model generated if firstMessageMode
#  is set to `assistant-speaks-first-with-model-generated-message`)
#  - `delete-history`: This deletes the entire conversation history on transfer.
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
#  assistant: assistant2 first message
#  user: Yes, please
#  assistant: how can i help?
#  user: i need help with my account
#  - `swap-system-message-in-history-and-remove-transfer-tool-messages`: This
#  replaces the original system message with the new assistant's system message on
#  transfer and removes transfer tool messages from conversation history sent to
#  the LLM.
#  Example:
#  Pre-transfer:
#  system: assistant1 system message
#  assistant: assistant1 first message
#  user: hey, good morning
#  assistant: how can i help?
#  user: i need help with my account
#  transfer-tool
#  transfer-tool-result
#  assistant: (destination.message)
#  Post-transfer:
#  system: assistant2 system message
#  assistant: assistant1 first message
#  user: hey, good morning
#  assistant: how can i help?
#  user: i need help with my account
#  assistant: (destination.message)
#  assistant: assistant2 first message (or model generated if firstMessageMode
#  is set to `assistant-speaks-first-with-model-generated-message`)
#  @default 'rolling-history'
    # @param assistant_name [String] This is the assistant to transfer the call to.
    # @param description [String] This is the description of the destination, used by the AI to choose when and
#  how to transfer the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferDestinationAssistant]
    def initialize(message: OMIT, transfer_mode: OMIT, assistant_name:, description: OMIT, additional_properties: nil)
      @message = message if message != OMIT
      @transfer_mode = transfer_mode if transfer_mode != OMIT
      @assistant_name = assistant_name
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "transferMode": transfer_mode, "assistantName": assistant_name, "description": description }.reject do | _k, v |
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
      unless parsed_json["message"].nil?
        message = parsed_json["message"].to_json
        message = Vapi::TransferDestinationAssistantMessage.from_json(json_object: message)
      else
        message = nil
      end
      transfer_mode = parsed_json["transferMode"]
      assistant_name = parsed_json["assistantName"]
      description = parsed_json["description"]
      new(
        message: message,
        transfer_mode: transfer_mode,
        assistant_name: assistant_name,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of TransferDestinationAssistant to a JSON object
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
      obj.message.nil? || Vapi::TransferDestinationAssistantMessage.validate_raw(obj: obj.message)
      obj.transfer_mode&.is_a?(Vapi::TransferMode) != false || raise("Passed value for field obj.transfer_mode is not the expected type, validation failed.")
      obj.assistant_name.is_a?(String) != false || raise("Passed value for field obj.assistant_name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end