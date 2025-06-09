# frozen_string_literal: true
require_relative "analysis_cost_breakdown"
require "ostruct"
require "json"

module Vapi
  class CostBreakdown
  # @return [Float] This is the cost of the transport provider, like Twilio or Vonage.
    attr_reader :transport
  # @return [Float] This is the cost of the speech-to-text service.
    attr_reader :stt
  # @return [Float] This is the cost of the language model.
    attr_reader :llm
  # @return [Float] This is the cost of the text-to-speech service.
    attr_reader :tts
  # @return [Float] This is the cost of Vapi.
    attr_reader :vapi
  # @return [Float] This is the total cost of the call.
    attr_reader :total
  # @return [Float] This is the LLM prompt tokens used for the call.
    attr_reader :llm_prompt_tokens
  # @return [Float] This is the LLM completion tokens used for the call.
    attr_reader :llm_completion_tokens
  # @return [Float] This is the TTS characters used for the call.
    attr_reader :tts_characters
  # @return [Vapi::AnalysisCostBreakdown] This is the cost of the analysis.
    attr_reader :analysis_cost_breakdown
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param transport [Float] This is the cost of the transport provider, like Twilio or Vonage.
    # @param stt [Float] This is the cost of the speech-to-text service.
    # @param llm [Float] This is the cost of the language model.
    # @param tts [Float] This is the cost of the text-to-speech service.
    # @param vapi [Float] This is the cost of Vapi.
    # @param total [Float] This is the total cost of the call.
    # @param llm_prompt_tokens [Float] This is the LLM prompt tokens used for the call.
    # @param llm_completion_tokens [Float] This is the LLM completion tokens used for the call.
    # @param tts_characters [Float] This is the TTS characters used for the call.
    # @param analysis_cost_breakdown [Vapi::AnalysisCostBreakdown] This is the cost of the analysis.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CostBreakdown]
    def initialize(transport: OMIT, stt: OMIT, llm: OMIT, tts: OMIT, vapi: OMIT, total: OMIT, llm_prompt_tokens: OMIT, llm_completion_tokens: OMIT, tts_characters: OMIT, analysis_cost_breakdown: OMIT, additional_properties: nil)
      @transport = transport if transport != OMIT
      @stt = stt if stt != OMIT
      @llm = llm if llm != OMIT
      @tts = tts if tts != OMIT
      @vapi = vapi if vapi != OMIT
      @total = total if total != OMIT
      @llm_prompt_tokens = llm_prompt_tokens if llm_prompt_tokens != OMIT
      @llm_completion_tokens = llm_completion_tokens if llm_completion_tokens != OMIT
      @tts_characters = tts_characters if tts_characters != OMIT
      @analysis_cost_breakdown = analysis_cost_breakdown if analysis_cost_breakdown != OMIT
      @additional_properties = additional_properties
      @_field_set = { "transport": transport, "stt": stt, "llm": llm, "tts": tts, "vapi": vapi, "total": total, "llmPromptTokens": llm_prompt_tokens, "llmCompletionTokens": llm_completion_tokens, "ttsCharacters": tts_characters, "analysisCostBreakdown": analysis_cost_breakdown }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CostBreakdown
    #
    # @param json_object [String] 
    # @return [Vapi::CostBreakdown]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      transport = parsed_json["transport"]
      stt = parsed_json["stt"]
      llm = parsed_json["llm"]
      tts = parsed_json["tts"]
      vapi = parsed_json["vapi"]
      total = parsed_json["total"]
      llm_prompt_tokens = parsed_json["llmPromptTokens"]
      llm_completion_tokens = parsed_json["llmCompletionTokens"]
      tts_characters = parsed_json["ttsCharacters"]
      unless parsed_json["analysisCostBreakdown"].nil?
        analysis_cost_breakdown = parsed_json["analysisCostBreakdown"].to_json
        analysis_cost_breakdown = Vapi::AnalysisCostBreakdown.from_json(json_object: analysis_cost_breakdown)
      else
        analysis_cost_breakdown = nil
      end
      new(
        transport: transport,
        stt: stt,
        llm: llm,
        tts: tts,
        vapi: vapi,
        total: total,
        llm_prompt_tokens: llm_prompt_tokens,
        llm_completion_tokens: llm_completion_tokens,
        tts_characters: tts_characters,
        analysis_cost_breakdown: analysis_cost_breakdown,
        additional_properties: struct
      )
    end
# Serialize an instance of CostBreakdown to a JSON object
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
      obj.transport&.is_a?(Float) != false || raise("Passed value for field obj.transport is not the expected type, validation failed.")
      obj.stt&.is_a?(Float) != false || raise("Passed value for field obj.stt is not the expected type, validation failed.")
      obj.llm&.is_a?(Float) != false || raise("Passed value for field obj.llm is not the expected type, validation failed.")
      obj.tts&.is_a?(Float) != false || raise("Passed value for field obj.tts is not the expected type, validation failed.")
      obj.vapi&.is_a?(Float) != false || raise("Passed value for field obj.vapi is not the expected type, validation failed.")
      obj.total&.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.llm_prompt_tokens&.is_a?(Float) != false || raise("Passed value for field obj.llm_prompt_tokens is not the expected type, validation failed.")
      obj.llm_completion_tokens&.is_a?(Float) != false || raise("Passed value for field obj.llm_completion_tokens is not the expected type, validation failed.")
      obj.tts_characters&.is_a?(Float) != false || raise("Passed value for field obj.tts_characters is not the expected type, validation failed.")
      obj.analysis_cost_breakdown.nil? || Vapi::AnalysisCostBreakdown.validate_raw(obj: obj.analysis_cost_breakdown)
    end
  end
end