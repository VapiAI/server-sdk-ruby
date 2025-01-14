# frozen_string_literal: true

require_relative "transfer_plan_mode"
require_relative "transfer_plan_message"
require_relative "summary_plan"
require "ostruct"
require "json"

module Vapi
  class TransferPlan
    # @return [Vapi::TransferPlanMode] This configures how transfer is executed and the experience of the destination
    #  party receiving the call.
    #  Usage:
    #  - `blind-transfer`: The assistant forwards the call to the destination without
    #  any message or summary.
    #  - `blind-transfer-add-summary-to-sip-header`: The assistant forwards the call to
    #  the destination and adds a SIP header X-Transfer-Summary to the call to include
    #  the summary.
    #  - `warm-transfer-say-message`: The assistant dials the destination, delivers the
    #  `message` to the destination party, connects the customer, and leaves the call.
    #  - `warm-transfer-say-summary`: The assistant dials the destination, provides a
    #  summary of the call to the destination party, connects the customer, and leaves
    #  the call.
    #  - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`: The
    #  assistant dials the destination, waits for the operator to speak, delivers the
    #  `message` to the destination party, and then connects the customer.
    #  - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`: The
    #  assistant dials the destination, waits for the operator to speak, provides a
    #  summary of the call to the destination party, and then connects the customer.
    #  @default 'blind-transfer'
    attr_reader :mode
    # @return [Vapi::TransferPlanMessage] This is the message the assistant will deliver to the destination party before
    #  connecting the customer.
    #  Usage:
    #  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`,
    #  `warm-transfer-say-message` or
    #  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`.
    attr_reader :message
    # @return [Hash{String => Object}] This specifies the SIP verb to use while transferring the call.
    #  - 'refer': Uses SIP REFER to transfer the call (default)
    #  - 'bye': Ends current call with SIP BYE
    attr_reader :sip_verb
    # @return [Vapi::SummaryPlan] This is the plan for generating a summary of the call to present to the
    #  destination party.
    #  Usage:
    #  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header` or
    #  `warm-transfer-say-summary` or
    #  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`.
    attr_reader :summary_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param mode [Vapi::TransferPlanMode] This configures how transfer is executed and the experience of the destination
    #  party receiving the call.
    #  Usage:
    #  - `blind-transfer`: The assistant forwards the call to the destination without
    #  any message or summary.
    #  - `blind-transfer-add-summary-to-sip-header`: The assistant forwards the call to
    #  the destination and adds a SIP header X-Transfer-Summary to the call to include
    #  the summary.
    #  - `warm-transfer-say-message`: The assistant dials the destination, delivers the
    #  `message` to the destination party, connects the customer, and leaves the call.
    #  - `warm-transfer-say-summary`: The assistant dials the destination, provides a
    #  summary of the call to the destination party, connects the customer, and leaves
    #  the call.
    #  - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`: The
    #  assistant dials the destination, waits for the operator to speak, delivers the
    #  `message` to the destination party, and then connects the customer.
    #  - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`: The
    #  assistant dials the destination, waits for the operator to speak, provides a
    #  summary of the call to the destination party, and then connects the customer.
    #  @default 'blind-transfer'
    # @param message [Vapi::TransferPlanMessage] This is the message the assistant will deliver to the destination party before
    #  connecting the customer.
    #  Usage:
    #  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`,
    #  `warm-transfer-say-message` or
    #  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`.
    # @param sip_verb [Hash{String => Object}] This specifies the SIP verb to use while transferring the call.
    #  - 'refer': Uses SIP REFER to transfer the call (default)
    #  - 'bye': Ends current call with SIP BYE
    # @param summary_plan [Vapi::SummaryPlan] This is the plan for generating a summary of the call to present to the
    #  destination party.
    #  Usage:
    #  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header` or
    #  `warm-transfer-say-summary` or
    #  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferPlan]
    def initialize(mode:, message: OMIT, sip_verb: OMIT, summary_plan: OMIT, additional_properties: nil)
      @mode = mode
      @message = message if message != OMIT
      @sip_verb = sip_verb if sip_verb != OMIT
      @summary_plan = summary_plan if summary_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "mode": mode,
        "message": message,
        "sipVerb": sip_verb,
        "summaryPlan": summary_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransferPlan
    #
    # @param json_object [String]
    # @return [Vapi::TransferPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      mode = parsed_json["mode"]
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Vapi::TransferPlanMessage.from_json(json_object: message)
      end
      sip_verb = parsed_json["sipVerb"]
      if parsed_json["summaryPlan"].nil?
        summary_plan = nil
      else
        summary_plan = parsed_json["summaryPlan"].to_json
        summary_plan = Vapi::SummaryPlan.from_json(json_object: summary_plan)
      end
      new(
        mode: mode,
        message: message,
        sip_verb: sip_verb,
        summary_plan: summary_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransferPlan to a JSON object
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
      obj.mode.is_a?(Vapi::TransferPlanMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
      obj.message.nil? || Vapi::TransferPlanMessage.validate_raw(obj: obj.message)
      obj.sip_verb&.is_a?(Hash) != false || raise("Passed value for field obj.sip_verb is not the expected type, validation failed.")
      obj.summary_plan.nil? || Vapi::SummaryPlan.validate_raw(obj: obj.summary_plan)
    end
  end
end
