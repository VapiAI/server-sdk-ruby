# frozen_string_literal: true
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
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param items_per_page [Float] 
    # @param total_items [Float] 
    # @param current_page [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PaginationMeta]
    def initialize(items_per_page:, total_items:, current_page:, additional_properties: nil)
      @items_per_page = items_per_page
      @total_items = total_items
      @current_page = current_page
      @additional_properties = additional_properties
      @_field_set = { "itemsPerPage": items_per_page, "totalItems": total_items, "currentPage": current_page }
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
      new(
        items_per_page: items_per_page,
        total_items: total_items,
        current_page: current_page,
        additional_properties: struct
      )
    end
# Serialize an instance of PaginationMeta to a JSON object
    #
    # @return [String]
    def to_json
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
    end
  end
end