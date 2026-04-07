# frozen_string_literal: true

module Vapi
  module Types
    class BackgroundSpeechDenoisingPlan < Internal::Types::Model
      field :smart_denoising_plan, -> { Vapi::Types::SmartDenoisingPlan }, optional: true, nullable: false, api_name: "smartDenoisingPlan"
      field :fourier_denoising_plan, -> { Vapi::Types::FourierDenoisingPlan }, optional: true, nullable: false, api_name: "fourierDenoisingPlan"
    end
  end
end
