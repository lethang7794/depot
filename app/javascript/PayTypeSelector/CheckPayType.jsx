import React from 'react'

class CheckPayType extends React.Component {
  render() {
    return(
      <div>
        <div>
          <label htmlFor="">Routing Number</label>
          <input type="number"/>
        </div>
        <div>
          <label htmlFor="">Accounting Number</label>
          <input type="number"/>
        </div>
      </div>
    );
  }
}
export default CheckPayType
