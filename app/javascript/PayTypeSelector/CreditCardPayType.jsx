import React from 'react'

class CreditCardPayType extends React.Component {
  render() {
    return(
      <div>
        <div>
          <label>Ower</label>
          <input type="text" />
        </div>
        <div>
          <label>Credit Card Number</label>
          <input type="number" />
        </div>
        <div>
          <label>Expiration Date</label>
          <input type="number" />
        </div>
        <div>
          <label>CVV</label>
          <input type="number" />
        </div>
      </div>
    );
  }
}
export default CreditCardPayType
