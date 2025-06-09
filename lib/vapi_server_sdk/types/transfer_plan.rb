# frozen_string_literal: true
require_relative "transfer_plan_mode"
require_relative "transfer_plan_message"
require_relative "summary_plan"
require_relative "transfer_fallback_plan"
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
#  - `warm-transfer-twiml`: The assistant dials the destination, executes the twiml
#  instructions on the destination call leg, connects the customer, and leaves the
#  call.
#  - `warm-transfer-experimental`: The assistant puts the customer on hold, dials
#  the destination, and if the destination answers (and is human), delivers a
#  message or summary before connecting the customer. If the destination is
#  unreachable or not human (e.g., with voicemail detection), the assistant
#  delivers the `fallbackMessage` to the customer and optionally ends the call.
#  @default 'blind-transfer'
    attr_reader :mode
  # @return [Vapi::TransferPlanMessage] This is the message the assistant will deliver to the destination party before
#  connecting the customer.
#  Usage:
#  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`,
#  `warm-transfer-say-message`,
#  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`, or
#  `warm-transfer-experimental`.
    attr_reader :message
  # @return [Float] This is the timeout in seconds for the
#  warm-transfer-wait-for-operator-to-speak-first-and-then-say-message/summary
#  @default 60
    attr_reader :timeout
  # @return [Hash{String => Object}] This specifies the SIP verb to use while transferring the call.
#  - 'refer': Uses SIP REFER to transfer the call (default)
#  - 'bye': Ends current call with SIP BYE
#  - 'dial': Uses SIP DIAL to transfer the call
    attr_reader :sip_verb
  # @return [String] This is the URL to an audio file played while the customer is on hold during
#  transfer.
#  Usage:
#  - Used only when `mode` is `warm-transfer-experimental`.
#  - Used when transferring calls to play hold audio for the customer.
#  - Must be a publicly accessible URL to an audio file.
#  - Supported formats: MP3 and WAV.
#  - If not provided, the default hold audio will be used.
    attr_reader :hold_audio_url
  # @return [String] This is the URL to an audio file played after the warm transfer message or
#  summary is delivered to the destination party.
#  It can be used to play a custom sound like 'beep' to notify that the transfer is
#  complete.
#  Usage:
#  - Used only when `mode` is `warm-transfer-experimental`.
#  - Used when transferring calls to play hold audio for the destination party.
#  - Must be a publicly accessible URL to an audio file.
#  - Supported formats: MP3 and WAV.
    attr_reader :transfer_complete_audio_url
  # @return [String] This is the TwiML instructions to execute on the destination call leg before
#  connecting the customer.
#  Usage:
#  - Used only when `mode` is `warm-transfer-twiml`.
#  - Supports only `Play`, `Say`, `Gather`, `Hangup` and `Pause` verbs.
#  - Maximum length is 4096 characters.
#  Example:
#  ```
#  <Say voice="alice" language="en-US">Hello, transferring a customer to you.</Say>
#  <Pause length="2"/>
#  <Say>They called about billing questions.</Say>
#  ```
    attr_reader :twiml
  # @return [Vapi::SummaryPlan] This is the plan for generating a summary of the call to present to the
#  destination party.
#  Usage:
#  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header` or
#  `warm-transfer-say-summary` or
#  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary` or
#  `warm-transfer-experimental`.
    attr_reader :summary_plan
  # @return [Boolean] This flag includes the sipHeaders from above in the refer to sip uri as url
#  encoded query params.
#  @default false
    attr_reader :sip_headers_in_refer_to_enabled
  # @return [Vapi::TransferFallbackPlan] This configures the fallback plan when the transfer fails (destination
#  unreachable, busy, or not human).
#  Usage:
#  - Used only when `mode` is `warm-transfer-experimental`.
#  - If not provided when using `warm-transfer-experimental`, a default message
#  will be used.
    attr_reader :fallback_plan
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
#  - `warm-transfer-twiml`: The assistant dials the destination, executes the twiml
#  instructions on the destination call leg, connects the customer, and leaves the
#  call.
#  - `warm-transfer-experimental`: The assistant puts the customer on hold, dials
#  the destination, and if the destination answers (and is human), delivers a
#  message or summary before connecting the customer. If the destination is
#  unreachable or not human (e.g., with voicemail detection), the assistant
#  delivers the `fallbackMessage` to the customer and optionally ends the call.
#  @default 'blind-transfer'
    # @param message [Vapi::TransferPlanMessage] This is the message the assistant will deliver to the destination party before
#  connecting the customer.
#  Usage:
#  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`,
#  `warm-transfer-say-message`,
#  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`, or
#  `warm-transfer-experimental`.
    # @param timeout [Float] This is the timeout in seconds for the
#  warm-transfer-wait-for-operator-to-speak-first-and-then-say-message/summary
#  @default 60
    # @param sip_verb [Hash{String => Object}] This specifies the SIP verb to use while transferring the call.
#  - 'refer': Uses SIP REFER to transfer the call (default)
#  - 'bye': Ends current call with SIP BYE
#  - 'dial': Uses SIP DIAL to transfer the call
    # @param hold_audio_url [String] This is the URL to an audio file played while the customer is on hold during
#  transfer.
#  Usage:
#  - Used only when `mode` is `warm-transfer-experimental`.
#  - Used when transferring calls to play hold audio for the customer.
#  - Must be a publicly accessible URL to an audio file.
#  - Supported formats: MP3 and WAV.
#  - If not provided, the default hold audio will be used.
    # @param transfer_complete_audio_url [String] This is the URL to an audio file played after the warm transfer message or
#  summary is delivered to the destination party.
#  It can be used to play a custom sound like 'beep' to notify that the transfer is
#  complete.
#  Usage:
#  - Used only when `mode` is `warm-transfer-experimental`.
#  - Used when transferring calls to play hold audio for the destination party.
#  - Must be a publicly accessible URL to an audio file.
#  - Supported formats: MP3 and WAV.
    # @param twiml [String] This is the TwiML instructions to execute on the destination call leg before
#  connecting the customer.
#  Usage:
#  - Used only when `mode` is `warm-transfer-twiml`.
#  - Supports only `Play`, `Say`, `Gather`, `Hangup` and `Pause` verbs.
#  - Maximum length is 4096 characters.
#  Example:
#  ```
#  <Say voice="alice" language="en-US">Hello, transferring a customer to you.</Say>
#  <Pause length="2"/>
#  <Say>They called about billing questions.</Say>
#  ```
    # @param summary_plan [Vapi::SummaryPlan] This is the plan for generating a summary of the call to present to the
#  destination party.
#  Usage:
#  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header` or
#  `warm-transfer-say-summary` or
#  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary` or
#  `warm-transfer-experimental`.
    # @param sip_headers_in_refer_to_enabled [Boolean] This flag includes the sipHeaders from above in the refer to sip uri as url
#  encoded query params.
#  @default false
    # @param fallback_plan [Vapi::TransferFallbackPlan] This configures the fallback plan when the transfer fails (destination
#  unreachable, busy, or not human).
#  Usage:
#  - Used only when `mode` is `warm-transfer-experimental`.
#  - If not provided when using `warm-transfer-experimental`, a default message
#  will be used.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferPlan]
    def initialize(mode:, message: OMIT, timeout: OMIT, sip_verb: OMIT, hold_audio_url: OMIT, transfer_complete_audio_url: OMIT, twiml: OMIT, summary_plan: OMIT, sip_headers_in_refer_to_enabled: OMIT, fallback_plan: OMIT, additional_properties: nil)
      @mode = mode
      @message = message if message != OMIT
      @timeout = timeout if timeout != OMIT
      @sip_verb = sip_verb if sip_verb != OMIT
      @hold_audio_url = hold_audio_url if hold_audio_url != OMIT
      @transfer_complete_audio_url = transfer_complete_audio_url if transfer_complete_audio_url != OMIT
      @twiml = twiml if twiml != OMIT
      @summary_plan = summary_plan if summary_plan != OMIT
      @sip_headers_in_refer_to_enabled = sip_headers_in_refer_to_enabled if sip_headers_in_refer_to_enabled != OMIT
      @fallback_plan = fallback_plan if fallback_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "mode": mode, "message": message, "timeout": timeout, "sipVerb": sip_verb, "holdAudioUrl": hold_audio_url, "transferCompleteAudioUrl": transfer_complete_audio_url, "twiml": twiml, "summaryPlan": summary_plan, "sipHeadersInReferToEnabled": sip_headers_in_refer_to_enabled, "fallbackPlan": fallback_plan }.reject do | _k, v |
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
      unless parsed_json["message"].nil?
        message = parsed_json["message"].to_json
        message = Vapi::TransferPlanMessage.from_json(json_object: message)
      else
        message = nil
      end
      timeout = parsed_json["timeout"]
      sip_verb = parsed_json["sipVerb"]
      hold_audio_url = parsed_json["holdAudioUrl"]
      transfer_complete_audio_url = parsed_json["transferCompleteAudioUrl"]
      twiml = parsed_json["twiml"]
      unless parsed_json["summaryPlan"].nil?
        summary_plan = parsed_json["summaryPlan"].to_json
        summary_plan = Vapi::SummaryPlan.from_json(json_object: summary_plan)
      else
        summary_plan = nil
      end
      sip_headers_in_refer_to_enabled = parsed_json["sipHeadersInReferToEnabled"]
      unless parsed_json["fallbackPlan"].nil?
        fallback_plan = parsed_json["fallbackPlan"].to_json
        fallback_plan = Vapi::TransferFallbackPlan.from_json(json_object: fallback_plan)
      else
        fallback_plan = nil
      end
      new(
        mode: mode,
        message: message,
        timeout: timeout,
        sip_verb: sip_verb,
        hold_audio_url: hold_audio_url,
        transfer_complete_audio_url: transfer_complete_audio_url,
        twiml: twiml,
        summary_plan: summary_plan,
        sip_headers_in_refer_to_enabled: sip_headers_in_refer_to_enabled,
        fallback_plan: fallback_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of TransferPlan to a JSON object
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
      obj.mode.is_a?(Vapi::TransferPlanMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
      obj.message.nil? || Vapi::TransferPlanMessage.validate_raw(obj: obj.message)
      obj.timeout&.is_a?(Float) != false || raise("Passed value for field obj.timeout is not the expected type, validation failed.")
      obj.sip_verb&.is_a?(Hash) != false || raise("Passed value for field obj.sip_verb is not the expected type, validation failed.")
      obj.hold_audio_url&.is_a?(String) != false || raise("Passed value for field obj.hold_audio_url is not the expected type, validation failed.")
      obj.transfer_complete_audio_url&.is_a?(String) != false || raise("Passed value for field obj.transfer_complete_audio_url is not the expected type, validation failed.")
      obj.twiml&.is_a?(String) != false || raise("Passed value for field obj.twiml is not the expected type, validation failed.")
      obj.summary_plan.nil? || Vapi::SummaryPlan.validate_raw(obj: obj.summary_plan)
      obj.sip_headers_in_refer_to_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.sip_headers_in_refer_to_enabled is not the expected type, validation failed.")
      obj.fallback_plan.nil? || Vapi::TransferFallbackPlan.validate_raw(obj: obj.fallback_plan)
    end
  end
end