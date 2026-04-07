# frozen_string_literal: true

module Vapi
  module Types
    class Mono < Internal::Types::Model
      field :combined_url, -> { String }, optional: true, nullable: false, api_name: "combinedUrl"
      field :assistant_url, -> { String }, optional: true, nullable: false, api_name: "assistantUrl"
      field :customer_url, -> { String }, optional: true, nullable: false, api_name: "customerUrl"
    end
  end
end
