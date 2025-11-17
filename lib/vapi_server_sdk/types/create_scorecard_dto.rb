# frozen_string_literal: true

require_relative "scorecard_metric"
require "ostruct"
require "json"

module Vapi
  class CreateScorecardDto
    # @return [String] This is the name of the scorecard. It is only for user reference and will not be
    #  used for any evaluation.
    attr_reader :name
    # @return [String] This is the description of the scorecard. It is only for user reference and will
    #  not be used for any evaluation.
    attr_reader :description
    # @return [Array<Vapi::ScorecardMetric>] These are the metrics that will be used to evaluate the scorecard.
    #  Each metric will have a set of conditions and points that will be used to
    #  generate the score.
    attr_reader :metrics
    # @return [Array<String>] These are the assistant IDs that this scorecard is linked to.
    #  When linked to assistants, this scorecard will be available for evaluation
    #  during those assistants' calls.
    attr_reader :assistant_ids
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the scorecard. It is only for user reference and will not be
    #  used for any evaluation.
    # @param description [String] This is the description of the scorecard. It is only for user reference and will
    #  not be used for any evaluation.
    # @param metrics [Array<Vapi::ScorecardMetric>] These are the metrics that will be used to evaluate the scorecard.
    #  Each metric will have a set of conditions and points that will be used to
    #  generate the score.
    # @param assistant_ids [Array<String>] These are the assistant IDs that this scorecard is linked to.
    #  When linked to assistants, this scorecard will be available for evaluation
    #  during those assistants' calls.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateScorecardDto]
    def initialize(metrics:, name: OMIT, description: OMIT, assistant_ids: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @description = description if description != OMIT
      @metrics = metrics
      @assistant_ids = assistant_ids if assistant_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "description": description,
        "metrics": metrics,
        "assistantIds": assistant_ids
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateScorecardDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateScorecardDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      description = parsed_json["description"]
      metrics = parsed_json["metrics"]&.map do |item|
        item = item.to_json
        Vapi::ScorecardMetric.from_json(json_object: item)
      end
      assistant_ids = parsed_json["assistantIds"]
      new(
        name: name,
        description: description,
        metrics: metrics,
        assistant_ids: assistant_ids,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateScorecardDto to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.metrics.is_a?(Array) != false || raise("Passed value for field obj.metrics is not the expected type, validation failed.")
      obj.assistant_ids&.is_a?(Array) != false || raise("Passed value for field obj.assistant_ids is not the expected type, validation failed.")
    end
  end
end
