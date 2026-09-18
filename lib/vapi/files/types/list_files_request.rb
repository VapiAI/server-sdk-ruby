# frozen_string_literal: true

module Vapi
  module Files
    module Types
      class ListFilesRequest < Internal::Types::Model
        field :purpose, -> { String }, optional: false, nullable: false
      end
    end
  end
end
