# frozen_string_literal: true

module Vapi
  module Types
    # Mono recording URLs for the combined call and isolated assistant and customer audio.
    class Mono < Internal::Types::Model
      field :combined_url, -> { String }, optional: true, nullable: false, api_name: "combinedUrl"
      field :assistant_url, -> { String }, optional: true, nullable: false, api_name: "assistantUrl"
      field :customer_url, -> { String }, optional: true, nullable: false, api_name: "customerUrl"
    end
  end
end
