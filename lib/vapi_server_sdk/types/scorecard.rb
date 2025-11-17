# frozen_string_literal: true

require "date"
require_relative "scorecard_metric"
require "ostruct"
require "json"

module Vapi
  class Scorecard
    # @return [String] This is the unique identifier for the scorecard.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this scorecard belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the scorecard was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the scorecard was last updated.
    attr_reader :updated_at
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

    # @param id [String] This is the unique identifier for the scorecard.
    # @param org_id [String] This is the unique identifier for the org that this scorecard belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the scorecard was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the scorecard was last updated.
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
    # @return [Vapi::Scorecard]
    def initialize(id:, org_id:, created_at:, updated_at:, metrics:, name: OMIT, description: OMIT,
                   assistant_ids: OMIT, additional_properties: nil)
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @description = description if description != OMIT
      @metrics = metrics
      @assistant_ids = assistant_ids if assistant_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "description": description,
        "metrics": metrics,
        "assistantIds": assistant_ids
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Scorecard
    #
    # @param json_object [String]
    # @return [Vapi::Scorecard]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      description = parsed_json["description"]
      metrics = parsed_json["metrics"]&.map do |item|
        item = item.to_json
        Vapi::ScorecardMetric.from_json(json_object: item)
      end
      assistant_ids = parsed_json["assistantIds"]
      new(
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        description: description,
        metrics: metrics,
        assistant_ids: assistant_ids,
        additional_properties: struct
      )
    end

    # Serialize an instance of Scorecard to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.metrics.is_a?(Array) != false || raise("Passed value for field obj.metrics is not the expected type, validation failed.")
      obj.assistant_ids&.is_a?(Array) != false || raise("Passed value for field obj.assistant_ids is not the expected type, validation failed.")
    end
  end
end
