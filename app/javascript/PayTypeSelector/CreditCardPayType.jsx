import React from 'react'

class CreditCardPayType extends React.Component {
  render() {
    return(
      <div>
        <div>
          <label>Cardholder Name</label>
          <input  type="text"
                  name="order[cardholder_name]"
                  id="order_cardholder_name"  />
        </div>
        <div>
          <label>Credit/Debit Card Number</label>
          <input  type="number"
                  name="order[credit_card_number]"
                  id="order_credit_cart_number"  />
        </div>
        <div>
          <label>Expiration Date</label>
          <input  type="number"
                  name="order[expiration_date]"
                  id="order_expiration_date"  />
        </div>
        <div>
          <label>CVV</label>
          <input  type="number"
                  name="order[cvv]"
                  id="order_cvv"  />
        </div>
      </div>
    );
  }
}
export default CreditCardPayType
