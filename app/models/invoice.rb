class Invoice < ApplicationRecord


  INSURANCE_VAT_RATE = 0.0
  VAT_RACE = 0.2
  INSURANCE_RATE = 0.02
  GARANTME_VARIABLE_RATE = 0.035
  GARANTME_FIXED_RATE = 365.0
  LEASE_DURATION = 12
  BROKER_FEE = 70.0
  private_constant :INSURANCE_VAT_RATE, :VAT_RACE, :INSURANCE_RATE, :GARANTME_VARIABLE_RATE, :GARANTME_FIXED_RATE, :LEASE_DURATION, :BROKER_FEE


  after_initialize do |invoice|
    puts ">>>>>>"
    puts invoice.contract_monthly_rent
    puts "<<<<<<<<<>>>>>>"
  end
end
