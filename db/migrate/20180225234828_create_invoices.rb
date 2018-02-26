class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.float :contract_monthly_rent
      t.float :insurance_excl_tax
      t.float :insurance_vat
      t.float :insurance_incl_tax
      t.float :broker_excl_tax
      t.float :broker_vat
      t.float :broker_incl_tax
      t.float :garantme_excl_tax
      t.float :garantme_vat
      t.float :garantme_incl_tax
      t.float :subtotal_excl_tax
      t.float :subtotal_vat
      t.float :subtotal_incl_tax
      t.float :discount_excl_tax
      t.float :discount_vat
      t.float :discount_incl_tax
      t.float :total_invoice_excl_tax
      t.float :total_invoice_vat
      t.float :total_invoice_incl_tax

      t.timestamps
    end
  end
end
