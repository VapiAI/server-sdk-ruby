# frozen_string_literal: true

module Vapi
  module Types
    class CallArtifactUploadItem < Internal::Types::Model
      field :type, -> { Vapi::Types::CallArtifactUploadItemType }, optional: false, nullable: false
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
