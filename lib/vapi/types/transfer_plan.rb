# frozen_string_literal: true

module Vapi
  module Types
    class TransferPlan < Internal::Types::Model
      field :mode, -> { Vapi::Types::TransferPlanMode }, optional: false, nullable: false
      field :message, -> { Vapi::Types::TransferPlanMessage }, optional: true, nullable: false
      field :timeout, -> { Integer }, optional: true, nullable: false
      field :sip_verb, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "sipVerb"
      field :dial_timeout, -> { Integer }, optional: true, nullable: false, api_name: "dialTimeout"
      field :hold_audio_url, -> { String }, optional: true, nullable: false, api_name: "holdAudioUrl"
      field :transfer_complete_audio_url, -> { String }, optional: true, nullable: false, api_name: "transferCompleteAudioUrl"
      field :context_engineering_plan, -> { Vapi::Types::TransferPlanContextEngineeringPlan }, optional: true, nullable: false, api_name: "contextEngineeringPlan"
      field :twiml, -> { String }, optional: true, nullable: false
      field :summary_plan, -> { Vapi::Types::SummaryPlan }, optional: true, nullable: false, api_name: "summaryPlan"
      field :sip_headers_in_refer_to_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sipHeadersInReferToEnabled"
      field :fallback_plan, -> { Vapi::Types::TransferFallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
