import Server from "./Server";
import { React } from "react";
import PropTypes from "prop-types"

export default function Product({id, addCartValue}) {
    const info = Server.GetProductInfo(id);

    addCartValue(info.price);

    return (
        <div>
            <p>I{"'"}m a product!</p>
            <p>Name: {info.name}</p>
            <p>Price: {info.price}</p>
            <p>In stock: {info.availability}</p>
        </div>
      
    );
}

Product.propTypes = {
    id: PropTypes.number.isRequired,
    addCartValue: PropTypes.func.isRequired
  }