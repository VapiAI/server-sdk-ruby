# frozen_string_literal: true

require_relative "recording_consent"
require "ostruct"
require "json"

module Vapi
  class Compliance
    # @return [Vapi::RecordingConsent] This is the recording consent of the call. Configure in
    #  `assistant.compliancePlan.recordingConsentPlan`.
    attr_reader :recording_consent
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recording_consent [Vapi::RecordingConsent] This is the recording consent of the call. Configure in
    #  `assistant.compliancePlan.recordingConsentPlan`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Compliance]
    def initialize(recording_consent: OMIT, additional_properties: nil)
      @recording_consent = recording_consent if recording_consent != OMIT
      @additional_properties = additional_properties
      @_field_set = { "recordingConsent": recording_consent }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Compliance
    #
    # @param json_object [String]
    # @return [Vapi::Compliance]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["recordingConsent"].nil?
        recording_consent = nil
      else
        recording_consent = parsed_json["recordingConsent"].to_json
        recording_consent = Vapi::RecordingConsent.from_json(json_object: recording_consent)
      end
      new(recording_consent: recording_consent, additional_properties: struct)
    end

    # Serialize an instance of Compliance to a JSON object
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
      obj.recording_consent.nil? || Vapi::RecordingConsent.validate_raw(obj: obj.recording_consent)
    end
  end
end
