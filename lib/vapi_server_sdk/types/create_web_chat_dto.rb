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
    # @return [Float] This is the expiration time for the session. This can ONLY be set if starting a
    #  new chat and therefore a new session is created.
    #  If session already exists, this will be ignored and NOT be updated for the
    #  existing session. Use PATCH /session/:id to update the session expiration time.
    attr_reader :session_expiration_seconds
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
    # @return [Boolean] This is a flag to indicate end of session. When true, the session will be marked
    #  as completed and the chat will be ended.
    #  Used to end session to send End-of-session report to the customer.
    #  When flag is set to true, any messages sent will not be processed and session
    #  will directly be marked as completed.
    attr_reader :session_end
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
    # @param session_expiration_seconds [Float] This is the expiration time for the session. This can ONLY be set if starting a
    #  new chat and therefore a new session is created.
    #  If session already exists, this will be ignored and NOT be updated for the
    #  existing session. Use PATCH /session/:id to update the session expiration time.
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
    # @param session_end [Boolean] This is a flag to indicate end of session. When true, the session will be marked
    #  as completed and the chat will be ended.
    #  Used to end session to send End-of-session report to the customer.
    #  When flag is set to true, any messages sent will not be processed and session
    #  will directly be marked as completed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWebChatDto]
    def initialize(assistant_id:, input:, session_id: OMIT, session_expiration_seconds: OMIT, assistant_overrides: OMIT,
                   customer: OMIT, stream: OMIT, session_end: OMIT, additional_properties: nil)
      @assistant_id = assistant_id
      @session_id = session_id if session_id != OMIT
      @session_expiration_seconds = session_expiration_seconds if session_expiration_seconds != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @customer = customer if customer != OMIT
      @input = input
      @stream = stream if stream != OMIT
      @session_end = session_end if session_end != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "assistantId": assistant_id,
        "sessionId": session_id,
        "sessionExpirationSeconds": session_expiration_seconds,
        "assistantOverrides": assistant_overrides,
        "customer": customer,
        "input": input,
        "stream": stream,
        "sessionEnd": session_end
      }.reject do |_k, v|
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
      session_expiration_seconds = parsed_json["sessionExpirationSeconds"]
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::ChatAssistantOverrides.from_json(json_object: assistant_overrides)
      end
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateWebCustomerDto.from_json(json_object: customer)
      end
      if parsed_json["input"].nil?
        input = nil
      else
        input = parsed_json["input"].to_json
        input = Vapi::CreateWebChatDtoInput.from_json(json_object: input)
      end
      stream = parsed_json["stream"]
      session_end = parsed_json["sessionEnd"]
      new(
        assistant_id: assistant_id,
        session_id: session_id,
        session_expiration_seconds: session_expiration_seconds,
        assistant_overrides: assistant_overrides,
        customer: customer,
        input: input,
        stream: stream,
        session_end: session_end,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateWebChatDto to a JSON object
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
      obj.assistant_id.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.session_id&.is_a?(String) != false || raise("Passed value for field obj.session_id is not the expected type, validation failed.")
      obj.session_expiration_seconds&.is_a?(Float) != false || raise("Passed value for field obj.session_expiration_seconds is not the expected type, validation failed.")
      obj.assistant_overrides.nil? || Vapi::ChatAssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.customer.nil? || Vapi::CreateWebCustomerDto.validate_raw(obj: obj.customer)
      Vapi::CreateWebChatDtoInput.validate_raw(obj: obj.input)
      obj.stream&.is_a?(Boolean) != false || raise("Passed value for field obj.stream is not the expected type, validation failed.")
      obj.session_end&.is_a?(Boolean) != false || raise("Passed value for field obj.session_end is not the expected type, validation failed.")
    end
  end
end
