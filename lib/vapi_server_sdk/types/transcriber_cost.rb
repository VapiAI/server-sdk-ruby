# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class TranscriberCost
  # @return [Hash{String => Object}] This is the transcriber that was used during the call.
#  This matches one of the below:
#  - `call.assistant.transcriber`,
#  - `call.assistantId->transcriber`,
#  - `call.squad[n].assistant.transcriber`,
#  - `call.squad[n].assistantId->transcriber`,
#  - `call.squadId->[n].assistant.transcriber`,
#  - `call.squadId->[n].assistantId->transcriber`.
    attr_reader :transcriber
  # @return [Float] This is the minutes of `transcriber` usage. This should match `call.endedAt` -
#  `call.startedAt` for single assistant calls, while squad calls will have
#  multiple transcriber costs one for each assistant that was used.
    attr_reader :minutes
  # @return [Float] This is the cost of the component in USD.
    attr_reader :cost
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param transcriber [Hash{String => Object}] This is the transcriber that was used during the call.
#  This matches one of the below:
#  - `call.assistant.transcriber`,
#  - `call.assistantId->transcriber`,
#  - `call.squad[n].assistant.transcriber`,
#  - `call.squad[n].assistantId->transcriber`,
#  - `call.squadId->[n].assistant.transcriber`,
#  - `call.squadId->[n].assistantId->transcriber`.
    # @param minutes [Float] This is the minutes of `transcriber` usage. This should match `call.endedAt` -
#  `call.startedAt` for single assistant calls, while squad calls will have
#  multiple transcriber costs one for each assistant that was used.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TranscriberCost]
    def initialize(transcriber:, minutes:, cost:, additional_properties: nil)
      @transcriber = transcriber
      @minutes = minutes
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "transcriber": transcriber, "minutes": minutes, "cost": cost }
    end
# Deserialize a JSON object to an instance of TranscriberCost
    #
    # @param json_object [String] 
    # @return [Vapi::TranscriberCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      transcriber = parsed_json["transcriber"]
      minutes = parsed_json["minutes"]
      cost = parsed_json["cost"]
      new(
        transcriber: transcriber,
        minutes: minutes,
        cost: cost,
        additional_properties: struct
      )
    end
# Serialize an instance of TranscriberCost to a JSON object
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
      obj.transcriber.is_a?(Hash) != false || raise("Passed value for field obj.transcriber is not the expected type, validation failed.")
      obj.minutes.is_a?(Float) != false || raise("Passed value for field obj.minutes is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end