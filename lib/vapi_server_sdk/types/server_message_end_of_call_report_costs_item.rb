# frozen_string_literal: true

require "json"
require_relative "transport_cost"
require_relative "transcriber_cost"
require_relative "model_cost"
require_relative "voice_cost"
require_relative "vapi_cost"
require_relative "voicemail_detection_cost"
require_relative "analysis_cost"
require_relative "knowledge_base_cost"

module Vapi
  class ServerMessageEndOfCallReportCostsItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  ServerMessageEndOfCallReportCostsItem
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "transport"
                 Vapi::TransportCost.from_json(json_object: json_object)
               when "transcriber"
                 Vapi::TranscriberCost.from_json(json_object: json_object)
               when "model"
                 Vapi::ModelCost.from_json(json_object: json_object)
               when "voice"
                 Vapi::VoiceCost.from_json(json_object: json_object)
               when "vapi"
                 Vapi::VapiCost.from_json(json_object: json_object)
               when "voicemail-detection"
                 Vapi::VoicemailDetectionCost.from_json(json_object: json_object)
               when "analysis"
                 Vapi::AnalysisCost.from_json(json_object: json_object)
               when "knowledge-base"
                 Vapi::KnowledgeBaseCost.from_json(json_object: json_object)
               else
                 Vapi::TransportCost.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "transport"
        { **@member.to_json, type: @discriminant }.to_json
      when "transcriber"
        { **@member.to_json, type: @discriminant }.to_json
      when "model"
        { **@member.to_json, type: @discriminant }.to_json
      when "voice"
        { **@member.to_json, type: @discriminant }.to_json
      when "vapi"
        { **@member.to_json, type: @discriminant }.to_json
      when "voicemail-detection"
        { **@member.to_json, type: @discriminant }.to_json
      when "analysis"
        { **@member.to_json, type: @discriminant }.to_json
      when "knowledge-base"
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
      when "transport"
        Vapi::TransportCost.validate_raw(obj: obj)
      when "transcriber"
        Vapi::TranscriberCost.validate_raw(obj: obj)
      when "model"
        Vapi::ModelCost.validate_raw(obj: obj)
      when "voice"
        Vapi::VoiceCost.validate_raw(obj: obj)
      when "vapi"
        Vapi::VapiCost.validate_raw(obj: obj)
      when "voicemail-detection"
        Vapi::VoicemailDetectionCost.validate_raw(obj: obj)
      when "analysis"
        Vapi::AnalysisCost.validate_raw(obj: obj)
      when "knowledge-base"
        Vapi::KnowledgeBaseCost.validate_raw(obj: obj)
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

    # @param member [Vapi::TransportCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.transport(member:)
      new(member: member, discriminant: "transport")
    end

    # @param member [Vapi::TranscriberCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.transcriber(member:)
      new(member: member, discriminant: "transcriber")
    end

    # @param member [Vapi::ModelCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.model(member:)
      new(member: member, discriminant: "model")
    end

    # @param member [Vapi::VoiceCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.voice(member:)
      new(member: member, discriminant: "voice")
    end

    # @param member [Vapi::VapiCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.vapi(member:)
      new(member: member, discriminant: "vapi")
    end

    # @param member [Vapi::VoicemailDetectionCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.voicemail_detection(member:)
      new(member: member, discriminant: "voicemail-detection")
    end

    # @param member [Vapi::AnalysisCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.analysis(member:)
      new(member: member, discriminant: "analysis")
    end

    # @param member [Vapi::KnowledgeBaseCost]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.knowledge_base(member:)
      new(member: member, discriminant: "knowledge-base")
    end
  end
end
