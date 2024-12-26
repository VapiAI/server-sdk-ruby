# frozen_string_literal: true

require "json"
require_relative "../../types/trieve_knowledge_base"
require_relative "../../types/custom_knowledge_base"

module Vapi
  class KnowledgeBases
    class KnowledgeBasesUpdateResponse
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of KnowledgeBasesUpdateResponse
      #
      # @param json_object [String]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.provider
                 when "trieve"
                   Vapi::TrieveKnowledgeBase.from_json(json_object: json_object)
                 when "custom-knowledge-base"
                   Vapi::CustomKnowledgeBase.from_json(json_object: json_object)
                 else
                   Vapi::TrieveKnowledgeBase.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.provider)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "trieve"
          { **@member.to_json, provider: @discriminant }.to_json
        when "custom-knowledge-base"
          { **@member.to_json, provider: @discriminant }.to_json
        else
          { "provider": @discriminant, value: @member }.to_json
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
        case obj.provider
        when "trieve"
          Vapi::TrieveKnowledgeBase.validate_raw(obj: obj)
        when "custom-knowledge-base"
          Vapi::CustomKnowledgeBase.validate_raw(obj: obj)
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

      # @param member [Vapi::TrieveKnowledgeBase]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse]
      def self.trieve(member:)
        new(member: member, discriminant: "trieve")
      end

      # @param member [Vapi::CustomKnowledgeBase]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse]
      def self.custom_knowledge_base(member:)
        new(member: member, discriminant: "custom-knowledge-base")
      end
    end
  end
end
