# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class PaginationMeta
    # @return [Float]
    attr_reader :items_per_page
    # @return [Float]
    attr_reader :total_items
    # @return [Float]
    attr_reader :current_page
    # @return [Boolean]
    attr_reader :items_beyond_retention
    # @return [DateTime]
    attr_reader :created_at_le
    # @return [DateTime]
    attr_reader :created_at_ge
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param items_per_page [Float]
    # @param total_items [Float]
    # @param current_page [Float]
    # @param items_beyond_retention [Boolean]
    # @param created_at_le [DateTime]
    # @param created_at_ge [DateTime]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PaginationMeta]
    def initialize(items_per_page:, total_items:, current_page:, items_beyond_retention: OMIT, created_at_le: OMIT,
                   created_at_ge: OMIT, additional_properties: nil)
      @items_per_page = items_per_page
      @total_items = total_items
      @current_page = current_page
      @items_beyond_retention = items_beyond_retention if items_beyond_retention != OMIT
      @created_at_le = created_at_le if created_at_le != OMIT
      @created_at_ge = created_at_ge if created_at_ge != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "itemsPerPage": items_per_page,
        "totalItems": total_items,
        "currentPage": current_page,
        "itemsBeyondRetention": items_beyond_retention,
        "createdAtLe": created_at_le,
        "createdAtGe": created_at_ge
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PaginationMeta
    #
    # @param json_object [String]
    # @return [Vapi::PaginationMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      items_per_page = parsed_json["itemsPerPage"]
      total_items = parsed_json["totalItems"]
      current_page = parsed_json["currentPage"]
      items_beyond_retention = parsed_json["itemsBeyondRetention"]
      created_at_le = (DateTime.parse(parsed_json["createdAtLe"]) unless parsed_json["createdAtLe"].nil?)
      created_at_ge = (DateTime.parse(parsed_json["createdAtGe"]) unless parsed_json["createdAtGe"].nil?)
      new(
        items_per_page: items_per_page,
        total_items: total_items,
        current_page: current_page,
        items_beyond_retention: items_beyond_retention,
        created_at_le: created_at_le,
        created_at_ge: created_at_ge,
        additional_properties: struct
      )
    end

    # Serialize an instance of PaginationMeta to a JSON object
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
      obj.items_per_page.is_a?(Float) != false || raise("Passed value for field obj.items_per_page is not the expected type, validation failed.")
      obj.total_items.is_a?(Float) != false || raise("Passed value for field obj.total_items is not the expected type, validation failed.")
      obj.current_page.is_a?(Float) != false || raise("Passed value for field obj.current_page is not the expected type, validation failed.")
      obj.items_beyond_retention&.is_a?(Boolean) != false || raise("Passed value for field obj.items_beyond_retention is not the expected type, validation failed.")
      obj.created_at_le&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at_le is not the expected type, validation failed.")
      obj.created_at_ge&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at_ge is not the expected type, validation failed.")
    end
  end
end
