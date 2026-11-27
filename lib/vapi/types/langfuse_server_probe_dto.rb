# frozen_string_literal: true

module Vapi
  module Types
    class LangfuseServerProbeDto < Internal::Types::Model
      field :api_url, -> { String }, optional: false, nullable: false, api_name: "apiUrl"
    end
  end
end
