# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class LangfuseObservabilityPlan
    # @return [String]
    attr_reader :provider
    # @return [Array<String>] This is an array of tags to be added to the Langfuse trace. Tags allow you to
    #  categorize and filter traces. https://langfuse.com/docs/tracing-features/tags
    attr_reader :tags
    # @return [Hash{String => Object}] This is a JSON object that will be added to the Langfuse trace. Traces can be
    #  enriched with metadata to better understand your users, application, and
    #  experiments. https://langfuse.com/docs/tracing-features/metadata
    #  By default it includes the call metadata, assistant metadata, and assistant
    #  overrides.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param tags [Array<String>] This is an array of tags to be added to the Langfuse trace. Tags allow you to
    #  categorize and filter traces. https://langfuse.com/docs/tracing-features/tags
    # @param metadata [Hash{String => Object}] This is a JSON object that will be added to the Langfuse trace. Traces can be
    #  enriched with metadata to better understand your users, application, and
    #  experiments. https://langfuse.com/docs/tracing-features/metadata
    #  By default it includes the call metadata, assistant metadata, and assistant
    #  overrides.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::LangfuseObservabilityPlan]
    def initialize(provider:, tags:, metadata: OMIT, additional_properties: nil)
      @provider = provider
      @tags = tags
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "tags": tags, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LangfuseObservabilityPlan
    #
    # @param json_object [String]
    # @return [Vapi::LangfuseObservabilityPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      tags = parsed_json["tags"]
      metadata = parsed_json["metadata"]
      new(
        provider: provider,
        tags: tags,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of LangfuseObservabilityPlan to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.tags.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
