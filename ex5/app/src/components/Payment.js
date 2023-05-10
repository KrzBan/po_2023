import Server from "./Server"
import { React } from "react";
import PropTypes from "prop-types"
export default function Payment({amount}) {

    function handleClick(){
        Server.SendPaymentInfo(amount);
    }

    return (
      <button onClick={handleClick}>Pay!</button>
    );
}

Payment.propTypes = {
  amount: PropTypes.number.isRequired
}