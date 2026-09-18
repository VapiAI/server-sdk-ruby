# frozen_string_literal: true

module Vapi
  module Types
    # Controls smart and Fourier denoising applied to customer audio before transcription.
    class BackgroundSpeechDenoisingPlan < Internal::Types::Model
      field :smart_denoising_plan, -> { Vapi::Types::SmartDenoisingPlan }, optional: true, nullable: false, api_name: "smartDenoisingPlan"
      field :fourier_denoising_plan, -> { Vapi::Types::FourierDenoisingPlan }, optional: true, nullable: false, api_name: "fourierDenoisingPlan"
    end
  end
end
