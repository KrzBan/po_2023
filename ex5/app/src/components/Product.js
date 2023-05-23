import { React } from "react";
import PropTypes from "prop-types"

export default function Product({name, price, availability}) {

    return (
        <div>
            <p>I{"'"}m a product!</p>
            <p>Name: {name}</p>
            <p>Price: {price}</p>
            <p>In stock: {availability}</p>
        </div>
      
    );
}

Product.propTypes = {
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    price: PropTypes.number.isRequired,
    availability: PropTypes.number.isRequired,
  }