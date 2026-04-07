# frozen_string_literal: true

module Vapi
  module Files
    module Types
      class DeleteFilesRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
