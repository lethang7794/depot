import React from 'react'

import NoPayType from './NoPayType';
import CreditCardPayType from './CreditCardPayType';
import CheckPayType from './CheckPayType';

class PayTypeSelector extends React.Component {
  constructor(props) {
    super(props);
    this.onPayTypeSelected = this.onPayTypeSelected.bind(this);
    this.state = { SelectedPayType: null };
  }
  //
  //
  onPayTypeSelected(event) {
    console.log(event.target.value);
    this.setState({SelectedPayType: event.target.value});
  }

  render() {
    let PayTypeCustomComponent = NoPayType;
    if (this.state.SelectedPayType == "Credit Card") {
      PayTypeCustomComponent = CreditCardPayType
    }
    else if (this.state.SelectedPayType == "Check") {
      PayTypeCustomComponent = CheckPayType
    }
    return (
      <div>
        <div className="field">
          <label htmlFor="order_pay_type">Pay Type From React</label>
          <select onChange={this.onPayTypeSelected} name="order[pay_type]" id="order_pay_type">
            <option value="">Select a payment method</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Check">Check</option>
            <option value="Cash">Cash</option>
          </select>
        </div>
        <PayTypeCustomComponent />
      </div>
    );
  }
}
export default PayTypeSelector
