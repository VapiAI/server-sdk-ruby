# frozen_string_literal: true

require "json"
require_relative "transport_cost"
require_relative "transcriber_cost"
require_relative "model_cost"
require_relative "voice_cost"
require_relative "vapi_cost"
require_relative "analysis_cost"

module Vapi
  class ServerMessageEndOfCallReportCostsItem
    # Deserialize a JSON object to an instance of
    #  ServerMessageEndOfCallReportCostsItem
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageEndOfCallReportCostsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::TransportCost.validate_raw(obj: struct)
        return Vapi::TransportCost.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::TranscriberCost.validate_raw(obj: struct)
        return Vapi::TranscriberCost.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ModelCost.validate_raw(obj: struct)
        return Vapi::ModelCost.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::VoiceCost.validate_raw(obj: struct)
        return Vapi::VoiceCost.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::VapiCost.validate_raw(obj: struct)
        return Vapi::VapiCost.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::AnalysisCost.validate_raw(obj: struct)
        return Vapi::AnalysisCost.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vapi::TransportCost.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::TranscriberCost.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ModelCost.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::VoiceCost.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::VapiCost.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::AnalysisCost.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
