var Main = createReactClass({
  getInitialState() {
    return { invoice: {} }
  },

  handleSubmit(val) {

      let data = JSON.stringify({ invoice: { contract_monthly_rent: val } })
      console.log(data)
      fetch('/api/v1/invoices/simulator',
          {
          method: "post",
          headers: {
              'Accept': 'application/json, text/plain',
              'Content-Type': 'application/json'
          },
          body: data
      })
      .then(r => r.json())
        .then(data =>  this.setState({ invoice: data }))
  },


    render() {
        return (
            <div className="container">

                <FormRent onSubmit={this.handleSubmit}/>


                { Object.keys(this.state.invoice).length !== 0 ? <Invoice data={this.state.invoice}/> : ''}

            </div>
        )
    }
});
