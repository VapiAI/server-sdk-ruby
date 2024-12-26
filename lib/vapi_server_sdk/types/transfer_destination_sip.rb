# frozen_string_literal: true

require_relative "transfer_destination_sip_message"
require_relative "transfer_plan"
require "ostruct"
require "json"

module Vapi
  class TransferDestinationSip
    # @return [Vapi::TransferDestinationSipMessage] This is spoken to the customer before connecting them to the destination.
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
    # @return [String] This is the SIP URI to transfer the call to.
    attr_reader :sip_uri
    # @return [Vapi::TransferPlan] This configures how transfer is executed and the experience of the destination
    #  party receiving the call. Defaults to `blind-transfer`.
    #  @default `transferPlan.mode='blind-transfer'`
    attr_reader :transfer_plan
    # @return [Hash{String => Object}] These are custom headers to be added to SIP refer during transfer call.
    attr_reader :sip_headers
    # @return [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::TransferDestinationSipMessage] This is spoken to the customer before connecting them to the destination.
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
    # @param sip_uri [String] This is the SIP URI to transfer the call to.
    # @param transfer_plan [Vapi::TransferPlan] This configures how transfer is executed and the experience of the destination
    #  party receiving the call. Defaults to `blind-transfer`.
    #  @default `transferPlan.mode='blind-transfer'`
    # @param sip_headers [Hash{String => Object}] These are custom headers to be added to SIP refer during transfer call.
    # @param description [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferDestinationSip]
    def initialize(sip_uri:, message: OMIT, transfer_plan: OMIT, sip_headers: OMIT, description: OMIT,
                   additional_properties: nil)
      @message = message if message != OMIT
      @sip_uri = sip_uri
      @transfer_plan = transfer_plan if transfer_plan != OMIT
      @sip_headers = sip_headers if sip_headers != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "message": message,
        "sipUri": sip_uri,
        "transferPlan": transfer_plan,
        "sipHeaders": sip_headers,
        "description": description
      }.reject do |_k, v|
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
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Vapi::TransferDestinationSipMessage.from_json(json_object: message)
      end
      sip_uri = parsed_json["sipUri"]
      if parsed_json["transferPlan"].nil?
        transfer_plan = nil
      else
        transfer_plan = parsed_json["transferPlan"].to_json
        transfer_plan = Vapi::TransferPlan.from_json(json_object: transfer_plan)
      end
      sip_headers = parsed_json["sipHeaders"]
      description = parsed_json["description"]
      new(
        message: message,
        sip_uri: sip_uri,
        transfer_plan: transfer_plan,
        sip_headers: sip_headers,
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
      obj.message.nil? || Vapi::TransferDestinationSipMessage.validate_raw(obj: obj.message)
      obj.sip_uri.is_a?(String) != false || raise("Passed value for field obj.sip_uri is not the expected type, validation failed.")
      obj.transfer_plan.nil? || Vapi::TransferPlan.validate_raw(obj: obj.transfer_plan)
      obj.sip_headers&.is_a?(Hash) != false || raise("Passed value for field obj.sip_headers is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
