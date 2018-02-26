class Invoice < ApplicationRecord

  #Fixed value
  INSURANCE_VAT_RATE = 0.0
  VAT_RACE = 0.2
  INSURANCE_RATE = 0.02
  GARANTME_VARIABLE_RATE = 0.035
  GARANTME_FIXED_RATE = 365.0
  LEASE_DURATION = 12
  BROKER_FEE = 70.0
  USER_DISCOUNT = 50.0
  private_constant :INSURANCE_VAT_RATE, :VAT_RACE, :INSURANCE_RATE, :GARANTME_VARIABLE_RATE, :GARANTME_FIXED_RATE, :LEASE_DURATION, :BROKER_FEE, :USER_DISCOUNT


  after_initialize do |invoice|

    #Test input value : is a float and greater than 0
    if ( invoice.contract_monthly_rent.is_a? Float ) && ( invoice.contract_monthly_rent > 0 )

      #intermediate calculation
      contract_annual_rent = invoice.contract_monthly_rent.round2(2) * LEASE_DURATION

      #Insurance
      self.insurance_excl_tax = (contract_annual_rent * INSURANCE_RATE).round2(2)
      self.insurance_vat = (self.insurance_excl_tax * INSURANCE_VAT_RATE).round2(2)
      self.insurance_incl_tax = self.insurance_excl_tax + self.insurance_vat

      #broker
      self.broker_excl_tax = BROKER_FEE
      self.broker_vat = (self.broker_excl_tax * INSURANCE_VAT_RATE).round2(2)
      self.broker_incl_tax = self.broker_excl_tax + self.broker_vat

      #intermediate calculation
      #QUESTION : incl or excl tax ?
      guarantor_pack_base_price = [GARANTME_FIXED_RATE, contract_annual_rent * GARANTME_VARIABLE_RATE].max.round2(2)
      total_insurance_fees = (self.broker_excl_tax + self.insurance_excl_tax).round2(2)

      #Garant me
      self.garantme_incl_tax = (guarantor_pack_base_price - total_insurance_fees).round2(2)
      self.garantme_vat = (VAT_RACE * self.garantme_incl_tax / (1 + VAT_RACE)).round2(2)
      self.garantme_excl_tax = (self.garantme_incl_tax - self.garantme_vat).round2(2)

      #Subtotal
      self.subtotal_excl_tax = (self.insurance_excl_tax + self.broker_excl_tax + self.garantme_excl_tax).round2(2)
      self.subtotal_vat = self.insurance_vat + self.broker_vat + self.garantme_vat
      self.subtotal_incl_tax = self.insurance_incl_tax + self.broker_incl_tax + self.garantme_incl_tax

      #Discount
      self.discount_incl_tax = USER_DISCOUNT
      self.discount_vat = (VAT_RACE * self.discount_incl_tax / (1 + VAT_RACE)).round2(2)
      self.discount_excl_tax = self.discount_incl_tax - self.discount_vat

      #Total
      self.total_invoice_excl_tax = (subtotal_excl_tax - discount_excl_tax).round2(2)
      self.total_invoice_vat = (subtotal_vat - discount_vat).round2(2)
      self.total_invoice_incl_tax = (subtotal_incl_tax - discount_incl_tax).round2(2)

    end

  end


end
