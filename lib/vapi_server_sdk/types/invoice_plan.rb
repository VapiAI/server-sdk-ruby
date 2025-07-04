# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class InvoicePlan
    # @return [String] This is the name of the company.
    attr_reader :company_name
    # @return [String] This is the address of the company.
    attr_reader :company_address
    # @return [String] This is the tax ID of the company.
    attr_reader :company_tax_id
    # @return [String] This is the preferred invoicing email of the company. If not specified, defaults
    #  to the subscription's email.
    attr_reader :company_email
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param company_name [String] This is the name of the company.
    # @param company_address [String] This is the address of the company.
    # @param company_tax_id [String] This is the tax ID of the company.
    # @param company_email [String] This is the preferred invoicing email of the company. If not specified, defaults
    #  to the subscription's email.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InvoicePlan]
    def initialize(company_name: OMIT, company_address: OMIT, company_tax_id: OMIT, company_email: OMIT,
                   additional_properties: nil)
      @company_name = company_name if company_name != OMIT
      @company_address = company_address if company_address != OMIT
      @company_tax_id = company_tax_id if company_tax_id != OMIT
      @company_email = company_email if company_email != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "companyName": company_name,
        "companyAddress": company_address,
        "companyTaxId": company_tax_id,
        "companyEmail": company_email
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InvoicePlan
    #
    # @param json_object [String]
    # @return [Vapi::InvoicePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      company_name = parsed_json["companyName"]
      company_address = parsed_json["companyAddress"]
      company_tax_id = parsed_json["companyTaxId"]
      company_email = parsed_json["companyEmail"]
      new(
        company_name: company_name,
        company_address: company_address,
        company_tax_id: company_tax_id,
        company_email: company_email,
        additional_properties: struct
      )
    end

    # Serialize an instance of InvoicePlan to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.company_name&.is_a?(String) != false || raise("Passed value for field obj.company_name is not the expected type, validation failed.")
      obj.company_address&.is_a?(String) != false || raise("Passed value for field obj.company_address is not the expected type, validation failed.")
      obj.company_tax_id&.is_a?(String) != false || raise("Passed value for field obj.company_tax_id is not the expected type, validation failed.")
      obj.company_email&.is_a?(String) != false || raise("Passed value for field obj.company_email is not the expected type, validation failed.")
    end
  end
end
