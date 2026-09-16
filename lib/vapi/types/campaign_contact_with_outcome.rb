# frozen_string_literal: true

module Vapi
  module Types
    class CampaignContactWithOutcome < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :number, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :status, -> { Vapi::Types::CampaignContactWithOutcomeStatus }, optional: false, nullable: false
      field :call_id, -> { String }, optional: true, nullable: false, api_name: "callId"
      field :dispatched_at, -> { String }, optional: true, nullable: false, api_name: "dispatchedAt"
      field :ended_reason, -> { String }, optional: true, nullable: false, api_name: "endedReason"
    end
  end
end
