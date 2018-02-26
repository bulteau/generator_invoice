var Invoice = createReactClass({
render() {

    const {
			data
		} = this.props

    return (
          <div className="row invoice">
            <table className="table">
              <thead>
                <tr><th scope="col" className="leftAlign">Designation</th><th scope="col">Price excl VAT</th><th scope="col">VAT</th><th scope="col">Price incl VAT</th></tr>
              </thead>
              <tbody>
                <tr>
                  <td scope="row">Insurance Premium</td>
                  <td>{data.insurance_excl_tax.toFixed(2)}</td>
                  <td>{data.insurance_vat.toFixed(2)}</td>
                  <td>{data.insurance_incl_tax.toFixed(2)}</td>
                </tr>
                <tr>
                  <td scope="row">Broker Fee</td>
                  <td>{data.broker_excl_tax.toFixed(2)}</td>
                  <td>{data.broker_vat.toFixed(2)}</td>
                  <td>{data.broker_incl_tax.toFixed(2)}</td>
                </tr>
                <tr>
                  <td scope="row">Garantme Service</td>
                  <td>{data.garantme_excl_tax.toFixed(2)}</td>
                  <td>{data.garantme_vat.toFixed(2)}</td>
                  <td>{data.garantme_incl_tax.toFixed(2)}</td>
                </tr>
                <tr className="subtotal">
                  <td scope="row">Sub-total</td>
                  <td>{data.subtotal_excl_tax.toFixed(2)}</td>
                  <td>{data.subtotal_vat.toFixed(2)}</td>
                  <td>{data.subtotal_incl_tax.toFixed(2)}</td>
                </tr>
                <tr className="discount">
                  <td scope="row">Discount</td>
                  <td>{data.discount_excl_tax.toFixed(2)}</td>
                  <td>{data.discount_vat.toFixed(2)}</td>
                  <td>{data.discount_incl_tax.toFixed(2)}</td>
                </tr>
                <tr className="total">
                  <td scope="row">Total</td>
                  <td>{data.total_invoice_excl_tax.toFixed(2)}</td>
                  <td>{data.total_invoice_vat.toFixed(2)}</td>
                  <td>{data.total_invoice_incl_tax.toFixed(2)}</td>
                </tr>
              </tbody>
            </table>
          </div>
        )}
});
