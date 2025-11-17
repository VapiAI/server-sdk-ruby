# frozen_string_literal: true

require_relative "security_filter_plan"
require_relative "compliance_plan_recording_consent_plan"
require "ostruct"
require "json"

module Vapi
  class CompliancePlan
    # @return [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored.
    #  At the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    attr_reader :hipaa_enabled
    # @return [Boolean] When this is enabled, the user will be restricted to use PCI-compliant
    #  providers, and no logs or transcripts are stored.
    #  At the end of the call, you will receive an end-of-call-report message to store
    #  on your server. Defaults to false.
    attr_reader :pci_enabled
    # @return [Vapi::SecurityFilterPlan] This is the security filter plan for the assistant. It allows filtering of
    #  transcripts for security threats before sending to LLM.
    attr_reader :security_filter_plan
    # @return [Vapi::CompliancePlanRecordingConsentPlan]
    attr_reader :recording_consent_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param hipaa_enabled [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored.
    #  At the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    # @param pci_enabled [Boolean] When this is enabled, the user will be restricted to use PCI-compliant
    #  providers, and no logs or transcripts are stored.
    #  At the end of the call, you will receive an end-of-call-report message to store
    #  on your server. Defaults to false.
    # @param security_filter_plan [Vapi::SecurityFilterPlan] This is the security filter plan for the assistant. It allows filtering of
    #  transcripts for security threats before sending to LLM.
    # @param recording_consent_plan [Vapi::CompliancePlanRecordingConsentPlan]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CompliancePlan]
    def initialize(hipaa_enabled: OMIT, pci_enabled: OMIT, security_filter_plan: OMIT, recording_consent_plan: OMIT,
                   additional_properties: nil)
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @pci_enabled = pci_enabled if pci_enabled != OMIT
      @security_filter_plan = security_filter_plan if security_filter_plan != OMIT
      @recording_consent_plan = recording_consent_plan if recording_consent_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "hipaaEnabled": hipaa_enabled,
        "pciEnabled": pci_enabled,
        "securityFilterPlan": security_filter_plan,
        "recordingConsentPlan": recording_consent_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CompliancePlan
    #
    # @param json_object [String]
    # @return [Vapi::CompliancePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      hipaa_enabled = parsed_json["hipaaEnabled"]
      pci_enabled = parsed_json["pciEnabled"]
      if parsed_json["securityFilterPlan"].nil?
        security_filter_plan = nil
      else
        security_filter_plan = parsed_json["securityFilterPlan"].to_json
        security_filter_plan = Vapi::SecurityFilterPlan.from_json(json_object: security_filter_plan)
      end
      if parsed_json["recordingConsentPlan"].nil?
        recording_consent_plan = nil
      else
        recording_consent_plan = parsed_json["recordingConsentPlan"].to_json
        recording_consent_plan = Vapi::CompliancePlanRecordingConsentPlan.from_json(json_object: recording_consent_plan)
      end
      new(
        hipaa_enabled: hipaa_enabled,
        pci_enabled: pci_enabled,
        security_filter_plan: security_filter_plan,
        recording_consent_plan: recording_consent_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of CompliancePlan to a JSON object
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
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.pci_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.pci_enabled is not the expected type, validation failed.")
      obj.security_filter_plan.nil? || Vapi::SecurityFilterPlan.validate_raw(obj: obj.security_filter_plan)
      obj.recording_consent_plan.nil? || Vapi::CompliancePlanRecordingConsentPlan.validate_raw(obj: obj.recording_consent_plan)
    end
  end
end
