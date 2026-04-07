# frozen_string_literal: true

module Vapi
  module Types
    class InvoicePlan < Internal::Types::Model
      field :company_name, -> { String }, optional: true, nullable: false, api_name: "companyName"
      field :company_address, -> { String }, optional: true, nullable: false, api_name: "companyAddress"
      field :company_tax_id, -> { String }, optional: true, nullable: false, api_name: "companyTaxId"
      field :company_email, -> { String }, optional: true, nullable: false, api_name: "companyEmail"
    end
  end
end
