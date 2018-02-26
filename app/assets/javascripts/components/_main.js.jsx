var Main = createReactClass({
  getInitialState() {
    return { invoice: {}, loading: false, error: {value: false, message: ""} }
  },

  handleSubmit(val) {

      //Verify input data
      let value = parseFloat(val);

      if(isNaN(value)) {
        this.setState({ error: {value: true, message: "Invalid monthly rent"} })
      } else {
        if(value > 0) {
              //Loading data
              this.setState({loading: true})
              let data = JSON.stringify({ invoice: { contract_monthly_rent: val } })
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
                .then(data =>  this.setState({ invoice: data, loading: false, error: {value: false, message: ""} }))
          } else {
              this.setState({ error: {value: true, message: "Monthly rent must be greater than 0"} })
          }
      }
  },


    render() {
        return (
            <div className="container">

                <FormRent onSubmit={this.handleSubmit}/>

                { this.state.error.value ? <div className="row alert alert-danger" role="alert">{this.state.error.message}</div> : ''}
                { Object.keys(this.state.invoice).length !== 0 && !this.state.error.value ? <Invoice data={this.state.invoice}/> : ''}
                { this.state.loading ? <Loader/> : ''}


            </div>
        )
    }
});
