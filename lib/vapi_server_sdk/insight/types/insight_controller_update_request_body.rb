# frozen_string_literal: true

require "json"
require_relative "../../types/update_bar_insight_from_call_table_dto"
require_relative "../../types/update_pie_insight_from_call_table_dto"
require_relative "../../types/update_line_insight_from_call_table_dto"
require_relative "../../types/update_text_insight_from_call_table_dto"

module Vapi
  class Insight
    class InsightControllerUpdateRequestBody
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Insight::InsightControllerUpdateRequestBody]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of InsightControllerUpdateRequestBody
      #
      # @param json_object [String]
      # @return [Vapi::Insight::InsightControllerUpdateRequestBody]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "bar"
                   Vapi::UpdateBarInsightFromCallTableDto.from_json(json_object: json_object)
                 when "pie"
                   Vapi::UpdatePieInsightFromCallTableDto.from_json(json_object: json_object)
                 when "line"
                   Vapi::UpdateLineInsightFromCallTableDto.from_json(json_object: json_object)
                 when "text"
                   Vapi::UpdateTextInsightFromCallTableDto.from_json(json_object: json_object)
                 else
                   Vapi::UpdateBarInsightFromCallTableDto.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "bar"
          { **@member.to_json, type: @discriminant }.to_json
        when "pie"
          { **@member.to_json, type: @discriminant }.to_json
        when "line"
          { **@member.to_json, type: @discriminant }.to_json
        when "text"
          { **@member.to_json, type: @discriminant }.to_json
        else
          { "type": @discriminant, value: @member }.to_json
        end
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.type
        when "bar"
          Vapi::UpdateBarInsightFromCallTableDto.validate_raw(obj: obj)
        when "pie"
          Vapi::UpdatePieInsightFromCallTableDto.validate_raw(obj: obj)
        when "line"
          Vapi::UpdateLineInsightFromCallTableDto.validate_raw(obj: obj)
        when "text"
          Vapi::UpdateTextInsightFromCallTableDto.validate_raw(obj: obj)
        else
          raise("Passed value matched no type within the union, validation failed.")
        end
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end

      # @param member [Vapi::UpdateBarInsightFromCallTableDto]
      # @return [Vapi::Insight::InsightControllerUpdateRequestBody]
      def self.bar(member:)
        new(member: member, discriminant: "bar")
      end

      # @param member [Vapi::UpdatePieInsightFromCallTableDto]
      # @return [Vapi::Insight::InsightControllerUpdateRequestBody]
      def self.pie(member:)
        new(member: member, discriminant: "pie")
      end

      # @param member [Vapi::UpdateLineInsightFromCallTableDto]
      # @return [Vapi::Insight::InsightControllerUpdateRequestBody]
      def self.line(member:)
        new(member: member, discriminant: "line")
      end

      # @param member [Vapi::UpdateTextInsightFromCallTableDto]
      # @return [Vapi::Insight::InsightControllerUpdateRequestBody]
      def self.text(member:)
        new(member: member, discriminant: "text")
      end
    end
  end
end
