# frozen_string_literal: true

require "json"
require_relative "../../types/update_trieve_knowledge_base_dto"
require_relative "../../types/update_custom_knowledge_base_dto"

module Vapi
  class KnowledgeBases
    class KnowledgeBasesUpdateRequest
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateRequest]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of KnowledgeBasesUpdateRequest
      #
      # @param json_object [String]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.provider
                 when "trieve"
                   Vapi::UpdateTrieveKnowledgeBaseDto.from_json(json_object: json_object)
                 when "custom-knowledge-base"
                   Vapi::UpdateCustomKnowledgeBaseDto.from_json(json_object: json_object)
                 else
                   Vapi::UpdateTrieveKnowledgeBaseDto.from_json(json_object: json_object)
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
          Vapi::UpdateTrieveKnowledgeBaseDto.validate_raw(obj: obj)
        when "custom-knowledge-base"
          Vapi::UpdateCustomKnowledgeBaseDto.validate_raw(obj: obj)
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

      # @param member [Vapi::UpdateTrieveKnowledgeBaseDto]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateRequest]
      def self.trieve(member:)
        new(member: member, discriminant: "trieve")
      end

      # @param member [Vapi::UpdateCustomKnowledgeBaseDto]
      # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateRequest]
      def self.custom_knowledge_base(member:)
        new(member: member, discriminant: "custom-knowledge-base")
      end
    end
  end
end
