import React from 'react'

class CreditCardPayType extends React.Component {
  render() {
    return(
      <div>
        <div>
          <label>Cardholder Name</label>
          <input  type="text"
                  name="order[cardholder_name]"
                  id="order_cardholder_name"
                  placeholder="LE QUANG THANG"  />
        </div>
        <div>
          <label>Credit/Debit Card Number</label>
          <input  type="number"
                  name="order[card_number]"
                  id="order_card_number"
                  placeholder="1234 1234 1234 1234"  />
        </div>
        <div>
          <label>Expiration Date</label>
          <input  type="number"
                  name="order[expiration_date]"
                  id="order_expiration_date"
                  placeholder="01/19"  />
        </div>
        <div>
          <label>CVV</label>
          <input  type="number"
                  name="order[cvv]"
                  id="order_cvv"
                  placeholder="789"  />
        </div>
      </div>
    );
  }
}
export default CreditCardPayType
