# frozen_string_literal: true

require_relative "create_customer_dto"
require_relative "twilio_sms_chat_transport_type"
require "ostruct"
require "json"

module Vapi
  class TwilioSmsChatTransport
    # @return [String] This is the phone number that will be used to send the SMS.
    #  If provided, will create a new session. If not provided, uses existing session's
    #  phoneNumberId.
    #  The phone number must have SMS enabled and belong to your organization.
    attr_reader :phone_number_id
    # @return [Vapi::CreateCustomerDto] This is the customer who will receive the SMS.
    #  If provided, will create a new session. If not provided, uses existing session's
    #  customer.
    attr_reader :customer
    # @return [Boolean] Whether to use LLM-generated messages for outbound SMS.
    #  When true (default), input is processed by the assistant for a response.
    #  When false, the input text is forwarded directly as the SMS message without LLM
    #  processing.
    #  Useful for sending pre-defined messages or notifications.
    attr_reader :use_llm_generated_message_for_outbound
    # @return [Vapi::TwilioSmsChatTransportType] The type of transport to use for sending the chat response.
    #  Currently supports 'twilio.sms' for SMS delivery via Twilio.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number_id [String] This is the phone number that will be used to send the SMS.
    #  If provided, will create a new session. If not provided, uses existing session's
    #  phoneNumberId.
    #  The phone number must have SMS enabled and belong to your organization.
    # @param customer [Vapi::CreateCustomerDto] This is the customer who will receive the SMS.
    #  If provided, will create a new session. If not provided, uses existing session's
    #  customer.
    # @param use_llm_generated_message_for_outbound [Boolean] Whether to use LLM-generated messages for outbound SMS.
    #  When true (default), input is processed by the assistant for a response.
    #  When false, the input text is forwarded directly as the SMS message without LLM
    #  processing.
    #  Useful for sending pre-defined messages or notifications.
    # @param type [Vapi::TwilioSmsChatTransportType] The type of transport to use for sending the chat response.
    #  Currently supports 'twilio.sms' for SMS delivery via Twilio.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TwilioSmsChatTransport]
    def initialize(type:, phone_number_id: OMIT, customer: OMIT, use_llm_generated_message_for_outbound: OMIT,
                   additional_properties: nil)
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @customer = customer if customer != OMIT
      if use_llm_generated_message_for_outbound != OMIT
        @use_llm_generated_message_for_outbound = use_llm_generated_message_for_outbound
      end
      @type = type
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumberId": phone_number_id,
        "customer": customer,
        "useLLMGeneratedMessageForOutbound": use_llm_generated_message_for_outbound,
        "type": type
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TwilioSmsChatTransport
    #
    # @param json_object [String]
    # @return [Vapi::TwilioSmsChatTransport]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      phone_number_id = parsed_json["phoneNumberId"]
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      end
      use_llm_generated_message_for_outbound = parsed_json["useLLMGeneratedMessageForOutbound"]
      type = parsed_json["type"]
      new(
        phone_number_id: phone_number_id,
        customer: customer,
        use_llm_generated_message_for_outbound: use_llm_generated_message_for_outbound,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of TwilioSmsChatTransport to a JSON object
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
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.use_llm_generated_message_for_outbound&.is_a?(Boolean) != false || raise("Passed value for field obj.use_llm_generated_message_for_outbound is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::TwilioSmsChatTransportType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
