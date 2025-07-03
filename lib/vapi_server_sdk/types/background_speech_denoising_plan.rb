# frozen_string_literal: true
require_relative "smart_denoising_plan"
require_relative "fourier_denoising_plan"
require "ostruct"
require "json"

module Vapi
  class BackgroundSpeechDenoisingPlan
  # @return [Vapi::SmartDenoisingPlan] Whether smart denoising using Krisp is enabled.
    attr_reader :smart_denoising_plan
  # @return [Vapi::FourierDenoisingPlan] Whether Fourier denoising is enabled. Note that this is experimental and may not
#  work as expected.
#  This can be combined with smart denoising, and will be run afterwards.
    attr_reader :fourier_denoising_plan
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param smart_denoising_plan [Vapi::SmartDenoisingPlan] Whether smart denoising using Krisp is enabled.
    # @param fourier_denoising_plan [Vapi::FourierDenoisingPlan] Whether Fourier denoising is enabled. Note that this is experimental and may not
#  work as expected.
#  This can be combined with smart denoising, and will be run afterwards.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BackgroundSpeechDenoisingPlan]
    def initialize(smart_denoising_plan: OMIT, fourier_denoising_plan: OMIT, additional_properties: nil)
      @smart_denoising_plan = smart_denoising_plan if smart_denoising_plan != OMIT
      @fourier_denoising_plan = fourier_denoising_plan if fourier_denoising_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "smartDenoisingPlan": smart_denoising_plan, "fourierDenoisingPlan": fourier_denoising_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BackgroundSpeechDenoisingPlan
    #
    # @param json_object [String] 
    # @return [Vapi::BackgroundSpeechDenoisingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["smartDenoisingPlan"].nil?
        smart_denoising_plan = parsed_json["smartDenoisingPlan"].to_json
        smart_denoising_plan = Vapi::SmartDenoisingPlan.from_json(json_object: smart_denoising_plan)
      else
        smart_denoising_plan = nil
      end
      unless parsed_json["fourierDenoisingPlan"].nil?
        fourier_denoising_plan = parsed_json["fourierDenoisingPlan"].to_json
        fourier_denoising_plan = Vapi::FourierDenoisingPlan.from_json(json_object: fourier_denoising_plan)
      else
        fourier_denoising_plan = nil
      end
      new(
        smart_denoising_plan: smart_denoising_plan,
        fourier_denoising_plan: fourier_denoising_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of BackgroundSpeechDenoisingPlan to a JSON object
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
      obj.smart_denoising_plan.nil? || Vapi::SmartDenoisingPlan.validate_raw(obj: obj.smart_denoising_plan)
      obj.fourier_denoising_plan.nil? || Vapi::FourierDenoisingPlan.validate_raw(obj: obj.fourier_denoising_plan)
    end
  end
end