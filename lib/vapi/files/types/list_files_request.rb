# frozen_string_literal: true

module Vapi
  module Files
    module Types
      class ListFilesRequest < Internal::Types::Model
        field :purpose, -> { Vapi::Files::Types::ListFilesRequestPurpose }, optional: true, nullable: false
      end
    end
  end
end
