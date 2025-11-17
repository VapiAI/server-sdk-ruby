# frozen_string_literal: true

require "json"
require_relative "../../types/bar_insight"
require_relative "../../types/pie_insight"
require_relative "../../types/line_insight"
require_relative "../../types/text_insight"

module Vapi
  class Insight
    class InsightControllerUpdateResponse
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Insight::InsightControllerUpdateResponse]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of InsightControllerUpdateResponse
      #
      # @param json_object [String]
      # @return [Vapi::Insight::InsightControllerUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "bar"
                   Vapi::BarInsight.from_json(json_object: json_object)
                 when "pie"
                   Vapi::PieInsight.from_json(json_object: json_object)
                 when "line"
                   Vapi::LineInsight.from_json(json_object: json_object)
                 when "text"
                   Vapi::TextInsight.from_json(json_object: json_object)
                 else
                   Vapi::BarInsight.from_json(json_object: json_object)
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
          Vapi::BarInsight.validate_raw(obj: obj)
        when "pie"
          Vapi::PieInsight.validate_raw(obj: obj)
        when "line"
          Vapi::LineInsight.validate_raw(obj: obj)
        when "text"
          Vapi::TextInsight.validate_raw(obj: obj)
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

      # @param member [Vapi::BarInsight]
      # @return [Vapi::Insight::InsightControllerUpdateResponse]
      def self.bar(member:)
        new(member: member, discriminant: "bar")
      end

      # @param member [Vapi::PieInsight]
      # @return [Vapi::Insight::InsightControllerUpdateResponse]
      def self.pie(member:)
        new(member: member, discriminant: "pie")
      end

      # @param member [Vapi::LineInsight]
      # @return [Vapi::Insight::InsightControllerUpdateResponse]
      def self.line(member:)
        new(member: member, discriminant: "line")
      end

      # @param member [Vapi::TextInsight]
      # @return [Vapi::Insight::InsightControllerUpdateResponse]
      def self.text(member:)
        new(member: member, discriminant: "text")
      end
    end
  end
end
