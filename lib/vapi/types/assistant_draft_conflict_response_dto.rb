# frozen_string_literal: true

module Vapi
  module Types
    class AssistantDraftConflictResponseDto < Internal::Types::Model
      field :existing_draft_id, -> { String }, optional: false, nullable: true, api_name: "existingDraftId"
      field :error, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
