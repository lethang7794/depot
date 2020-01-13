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
          <label htmlFor="order_pay_type">{ I18n.t("orders.form.pay_type") }</label>
          <select onChange={this.onPayTypeSelected} name="order[pay_type]" id="order_pay_type">
            <option value="">{ I18n.t("orders.form.pay_type_prompt") }</option>
            <option value="Credit Card">{ I18n.t("orders.form.pay_types.credit_card") }</option>
            <option value="Check">{ I18n.t("orders.form.pay_types.check") }</option>
            <option value="Cash">{ I18n.t("orders.form.pay_types.cash") }</option>
          </select>
        </div>
        <PayTypeCustomComponent />
      </div>
    );
  }
}
export default PayTypeSelector
