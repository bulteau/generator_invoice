var FormRent = createReactClass({

    handleClick() {
      let rent = this.contract_monthly_rent.value
      this.props.onSubmit(rent)
    },

    render() {
        return (
            <div className="row">
              <div className="form-inline">
                  <div className="form-group mb-2 mr-sm-2">
                    <label>Enter the monthly rent including charges</label>
                  </div>
                  <div className="form-group mb-2 mr-sm-2">
                    <div className="input-group">
                      <input ref={(input) => { this.contract_monthly_rent = input; }} id="rent1"  className="form-control" />
                      <div className="input-group-append">
                        <span className="input-group-text">€</span>
                      </div>
                    </div>
                  </div>
                  
                    <button onClick={this.handleClick}  className="btn btn-primary mb-2">Generate</button>

                  <div className="form-group mb-2 mr-sm-2">
                    { this.props.isLoading ? <Loader/> : ''}
                  </div>

              </div>
            </div>
        )
    }

});
