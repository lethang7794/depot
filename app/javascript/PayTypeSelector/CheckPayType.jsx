import React from 'react'

class CheckPayType extends React.Component {
  render() {
    return(
      <div>
        <div>
          <label htmlFor="">Routing Number</label>
          <input  type="number"
                  name="order[routing_number]"
                  id="order_routing_number"  />
        </div>
        <div>
          <label htmlFor="">Accounting Number</label>
          <input  type="number"
                  name="order[accouting_number]"
                  id="order_accouting_number"  />
        </div>
      </div>
    );
  }
}
export default CheckPayType
