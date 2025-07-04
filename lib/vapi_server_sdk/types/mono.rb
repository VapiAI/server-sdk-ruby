# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Mono
    # @return [String] This is the combined recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :combined_url
    # @return [String] This is the mono recording url for the assistant. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :assistant_url
    # @return [String] This is the mono recording url for the customer. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :customer_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param combined_url [String] This is the combined recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    # @param assistant_url [String] This is the mono recording url for the assistant. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    # @param customer_url [String] This is the mono recording url for the customer. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Mono]
    def initialize(combined_url: OMIT, assistant_url: OMIT, customer_url: OMIT, additional_properties: nil)
      @combined_url = combined_url if combined_url != OMIT
      @assistant_url = assistant_url if assistant_url != OMIT
      @customer_url = customer_url if customer_url != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "combinedUrl": combined_url,
        "assistantUrl": assistant_url,
        "customerUrl": customer_url
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Mono
    #
    # @param json_object [String]
    # @return [Vapi::Mono]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      combined_url = parsed_json["combinedUrl"]
      assistant_url = parsed_json["assistantUrl"]
      customer_url = parsed_json["customerUrl"]
      new(
        combined_url: combined_url,
        assistant_url: assistant_url,
        customer_url: customer_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of Mono to a JSON object
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
      obj.combined_url&.is_a?(String) != false || raise("Passed value for field obj.combined_url is not the expected type, validation failed.")
      obj.assistant_url&.is_a?(String) != false || raise("Passed value for field obj.assistant_url is not the expected type, validation failed.")
      obj.customer_url&.is_a?(String) != false || raise("Passed value for field obj.customer_url is not the expected type, validation failed.")
    end
  end
end
