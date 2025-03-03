# frozen_string_literal: true

require_relative "artifact"
require "ostruct"
require "json"

module Vapi
  class TestSuiteRunTestAttemptCall
    # @return [Vapi::Artifact] This is the artifact associated with the call.
    attr_reader :artifact
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param artifact [Vapi::Artifact] This is the artifact associated with the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteRunTestAttemptCall]
    def initialize(artifact:, additional_properties: nil)
      @artifact = artifact
      @additional_properties = additional_properties
      @_field_set = { "artifact": artifact }
    end

    # Deserialize a JSON object to an instance of TestSuiteRunTestAttemptCall
    #
    # @param json_object [String]
    # @return [Vapi::TestSuiteRunTestAttemptCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["artifact"].nil?
        artifact = nil
      else
        artifact = parsed_json["artifact"].to_json
        artifact = Vapi::Artifact.from_json(json_object: artifact)
      end
      new(artifact: artifact, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunTestAttemptCall to a JSON object
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
      Vapi::Artifact.validate_raw(obj: obj.artifact)
    end
  end
end
