# frozen_string_literal: true

require_relative "get_chat_paginated_dto_sort_order"
require "date"
require "ostruct"
require "json"

module Vapi
  class GetChatPaginatedDto
    # @return [String] This is the unique identifier for the assistant that will be used for the chat.
    attr_reader :assistant_id
    # @return [String] This is the unique identifier for the squad that will be used for the chat.
    attr_reader :squad_id
    # @return [String] This is the unique identifier for the session that will be used for the chat.
    attr_reader :session_id
    # @return [String] This is the unique identifier for the previous chat to filter by.
    attr_reader :previous_chat_id
    # @return [Float] This is the page number to return. Defaults to 1.
    attr_reader :page
    # @return [Vapi::GetChatPaginatedDtoSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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

    # @param assistant_id [String] This is the unique identifier for the assistant that will be used for the chat.
    # @param squad_id [String] This is the unique identifier for the squad that will be used for the chat.
    # @param session_id [String] This is the unique identifier for the session that will be used for the chat.
    # @param previous_chat_id [String] This is the unique identifier for the previous chat to filter by.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::GetChatPaginatedDtoSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::GetChatPaginatedDto]
    def initialize(assistant_id: OMIT, squad_id: OMIT, session_id: OMIT, previous_chat_id: OMIT, page: OMIT,
                   sort_order: OMIT, limit: OMIT, created_at_gt: OMIT, created_at_lt: OMIT, created_at_ge: OMIT, created_at_le: OMIT, updated_at_gt: OMIT, updated_at_lt: OMIT, updated_at_ge: OMIT, updated_at_le: OMIT, additional_properties: nil)
      @assistant_id = assistant_id if assistant_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @session_id = session_id if session_id != OMIT
      @previous_chat_id = previous_chat_id if previous_chat_id != OMIT
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
        "assistantId": assistant_id,
        "squadId": squad_id,
        "sessionId": session_id,
        "previousChatId": previous_chat_id,
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

    # Deserialize a JSON object to an instance of GetChatPaginatedDto
    #
    # @param json_object [String]
    # @return [Vapi::GetChatPaginatedDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      assistant_id = parsed_json["assistantId"]
      squad_id = parsed_json["squadId"]
      session_id = parsed_json["sessionId"]
      previous_chat_id = parsed_json["previousChatId"]
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
        assistant_id: assistant_id,
        squad_id: squad_id,
        session_id: session_id,
        previous_chat_id: previous_chat_id,
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

    # Serialize an instance of GetChatPaginatedDto to a JSON object
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
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.session_id&.is_a?(String) != false || raise("Passed value for field obj.session_id is not the expected type, validation failed.")
      obj.previous_chat_id&.is_a?(String) != false || raise("Passed value for field obj.previous_chat_id is not the expected type, validation failed.")
      obj.page&.is_a?(Float) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
      obj.sort_order&.is_a?(Vapi::GetChatPaginatedDtoSortOrder) != false || raise("Passed value for field obj.sort_order is not the expected type, validation failed.")
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
