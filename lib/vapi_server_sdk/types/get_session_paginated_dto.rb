# frozen_string_literal: true

require_relative "get_session_paginated_dto_sort_order"
require "date"
require "ostruct"
require "json"

module Vapi
  class GetSessionPaginatedDto
    # @return [String] This is the name of the session to filter by.
    attr_reader :name
    # @return [String] This is the ID of the assistant to filter sessions by.
    attr_reader :assistant_id
    # @return [String] This is the ID of the workflow to filter sessions by.
    attr_reader :workflow_id
    # @return [Float] This is the page number to return. Defaults to 1.
    attr_reader :page
    # @return [Vapi::GetSessionPaginatedDtoSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
    attr_reader :sort_order
    # @return [Float] This is the maximum number of items to return. Defaults to 100.
    attr_reader :limit
    # @return [DateTime] This will return items where the createdAt is greater than the specified value.
    attr_reader :created_at_gt
    # @return [DateTime] This will return items where the createdAt is less than the specified value.
    attr_reader :created_at_lt
    # @return [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    attr_reader :created_at_ge
    # @return [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    attr_reader :created_at_le
    # @return [DateTime] This will return items where the updatedAt is greater than the specified value.
    attr_reader :updated_at_gt
    # @return [DateTime] This will return items where the updatedAt is less than the specified value.
    attr_reader :updated_at_lt
    # @return [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    attr_reader :updated_at_ge
    # @return [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    attr_reader :updated_at_le
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the session to filter by.
    # @param assistant_id [String] This is the ID of the assistant to filter sessions by.
    # @param workflow_id [String] This is the ID of the workflow to filter sessions by.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::GetSessionPaginatedDtoSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GetSessionPaginatedDto]
    def initialize(name: OMIT, assistant_id: OMIT, workflow_id: OMIT, page: OMIT, sort_order: OMIT, limit: OMIT,
                   created_at_gt: OMIT, created_at_lt: OMIT, created_at_ge: OMIT, created_at_le: OMIT, updated_at_gt: OMIT, updated_at_lt: OMIT, updated_at_ge: OMIT, updated_at_le: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @workflow_id = workflow_id if workflow_id != OMIT
      @page = page if page != OMIT
      @sort_order = sort_order if sort_order != OMIT
      @limit = limit if limit != OMIT
      @created_at_gt = created_at_gt if created_at_gt != OMIT
      @created_at_lt = created_at_lt if created_at_lt != OMIT
      @created_at_ge = created_at_ge if created_at_ge != OMIT
      @created_at_le = created_at_le if created_at_le != OMIT
      @updated_at_gt = updated_at_gt if updated_at_gt != OMIT
      @updated_at_lt = updated_at_lt if updated_at_lt != OMIT
      @updated_at_ge = updated_at_ge if updated_at_ge != OMIT
      @updated_at_le = updated_at_le if updated_at_le != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "assistantId": assistant_id,
        "workflowId": workflow_id,
        "page": page,
        "sortOrder": sort_order,
        "limit": limit,
        "createdAtGt": created_at_gt,
        "createdAtLt": created_at_lt,
        "createdAtGe": created_at_ge,
        "createdAtLe": created_at_le,
        "updatedAtGt": updated_at_gt,
        "updatedAtLt": updated_at_lt,
        "updatedAtGe": updated_at_ge,
        "updatedAtLe": updated_at_le
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetSessionPaginatedDto
    #
    # @param json_object [String]
    # @return [Vapi::GetSessionPaginatedDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      workflow_id = parsed_json["workflowId"]
      page = parsed_json["page"]
      sort_order = parsed_json["sortOrder"]
      limit = parsed_json["limit"]
      created_at_gt = (DateTime.parse(parsed_json["createdAtGt"]) unless parsed_json["createdAtGt"].nil?)
      created_at_lt = (DateTime.parse(parsed_json["createdAtLt"]) unless parsed_json["createdAtLt"].nil?)
      created_at_ge = (DateTime.parse(parsed_json["createdAtGe"]) unless parsed_json["createdAtGe"].nil?)
      created_at_le = (DateTime.parse(parsed_json["createdAtLe"]) unless parsed_json["createdAtLe"].nil?)
      updated_at_gt = (DateTime.parse(parsed_json["updatedAtGt"]) unless parsed_json["updatedAtGt"].nil?)
      updated_at_lt = (DateTime.parse(parsed_json["updatedAtLt"]) unless parsed_json["updatedAtLt"].nil?)
      updated_at_ge = (DateTime.parse(parsed_json["updatedAtGe"]) unless parsed_json["updatedAtGe"].nil?)
      updated_at_le = (DateTime.parse(parsed_json["updatedAtLe"]) unless parsed_json["updatedAtLe"].nil?)
      new(
        name: name,
        assistant_id: assistant_id,
        workflow_id: workflow_id,
        page: page,
        sort_order: sort_order,
        limit: limit,
        created_at_gt: created_at_gt,
        created_at_lt: created_at_lt,
        created_at_ge: created_at_ge,
        created_at_le: created_at_le,
        updated_at_gt: updated_at_gt,
        updated_at_lt: updated_at_lt,
        updated_at_ge: updated_at_ge,
        updated_at_le: updated_at_le,
        additional_properties: struct
      )
    end

    # Serialize an instance of GetSessionPaginatedDto to a JSON object
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
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.page&.is_a?(Float) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
      obj.sort_order&.is_a?(Vapi::GetSessionPaginatedDtoSortOrder) != false || raise("Passed value for field obj.sort_order is not the expected type, validation failed.")
      obj.limit&.is_a?(Float) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
      obj.created_at_gt&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at_gt is not the expected type, validation failed.")
      obj.created_at_lt&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at_lt is not the expected type, validation failed.")
      obj.created_at_ge&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at_ge is not the expected type, validation failed.")
      obj.created_at_le&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at_le is not the expected type, validation failed.")
      obj.updated_at_gt&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at_gt is not the expected type, validation failed.")
      obj.updated_at_lt&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at_lt is not the expected type, validation failed.")
      obj.updated_at_ge&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at_ge is not the expected type, validation failed.")
      obj.updated_at_le&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at_le is not the expected type, validation failed.")
    end
  end
end
