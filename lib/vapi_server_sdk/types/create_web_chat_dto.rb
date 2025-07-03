# frozen_string_literal: true
require_relative "chat_assistant_overrides"
require_relative "create_web_customer_dto"
require_relative "create_web_chat_dto_input"
require "ostruct"
require "json"

module Vapi
  class CreateWebChatDto
  # @return [String] The assistant ID to use for this chat
    attr_reader :assistant_id
  # @return [String] This is the ID of the session that will be used for the chat.
#  If provided, the conversation will continue from the previous state.
#  If not provided or expired, a new session will be created.
    attr_reader :session_id
  # @return [Vapi::ChatAssistantOverrides] These are the variable values that will be used to replace template variables in
#  the assistant messages.
#  Only variable substitution is supported in web chat - other assistant properties
#  cannot be overridden.
    attr_reader :assistant_overrides
  # @return [Vapi::CreateWebCustomerDto] This is the customer information for the chat.
#  Used to automatically manage sessions for repeat customers.
    attr_reader :customer
  # @return [Vapi::CreateWebChatDtoInput] This is the input text for the chat.
#  Can be a string or an array of chat messages.
    attr_reader :input
  # @return [Boolean] This is a flag that determines whether the response should be streamed.
#  When true, the response will be sent as chunks of text.
    attr_reader :stream
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assistant_id [String] The assistant ID to use for this chat
    # @param session_id [String] This is the ID of the session that will be used for the chat.
#  If provided, the conversation will continue from the previous state.
#  If not provided or expired, a new session will be created.
    # @param assistant_overrides [Vapi::ChatAssistantOverrides] These are the variable values that will be used to replace template variables in
#  the assistant messages.
#  Only variable substitution is supported in web chat - other assistant properties
#  cannot be overridden.
    # @param customer [Vapi::CreateWebCustomerDto] This is the customer information for the chat.
#  Used to automatically manage sessions for repeat customers.
    # @param input [Vapi::CreateWebChatDtoInput] This is the input text for the chat.
#  Can be a string or an array of chat messages.
    # @param stream [Boolean] This is a flag that determines whether the response should be streamed.
#  When true, the response will be sent as chunks of text.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWebChatDto]
    def initialize(assistant_id:, session_id: OMIT, assistant_overrides: OMIT, customer: OMIT, input:, stream: OMIT, additional_properties: nil)
      @assistant_id = assistant_id
      @session_id = session_id if session_id != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @customer = customer if customer != OMIT
      @input = input
      @stream = stream if stream != OMIT
      @additional_properties = additional_properties
      @_field_set = { "assistantId": assistant_id, "sessionId": session_id, "assistantOverrides": assistant_overrides, "customer": customer, "input": input, "stream": stream }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateWebChatDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateWebChatDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      assistant_id = parsed_json["assistantId"]
      session_id = parsed_json["sessionId"]
      unless parsed_json["assistantOverrides"].nil?
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::ChatAssistantOverrides.from_json(json_object: assistant_overrides)
      else
        assistant_overrides = nil
      end
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateWebCustomerDto.from_json(json_object: customer)
      else
        customer = nil
      end
      unless parsed_json["input"].nil?
        input = parsed_json["input"].to_json
        input = Vapi::CreateWebChatDtoInput.from_json(json_object: input)
      else
        input = nil
      end
      stream = parsed_json["stream"]
      new(
        assistant_id: assistant_id,
        session_id: session_id,
        assistant_overrides: assistant_overrides,
        customer: customer,
        input: input,
        stream: stream,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateWebChatDto to a JSON object
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
      obj.assistant_id.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.session_id&.is_a?(String) != false || raise("Passed value for field obj.session_id is not the expected type, validation failed.")
      obj.assistant_overrides.nil? || Vapi::ChatAssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.customer.nil? || Vapi::CreateWebCustomerDto.validate_raw(obj: obj.customer)
      Vapi::CreateWebChatDtoInput.validate_raw(obj: obj.input)
      obj.stream&.is_a?(Boolean) != false || raise("Passed value for field obj.stream is not the expected type, validation failed.")
    end
  end
end