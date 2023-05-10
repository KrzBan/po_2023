
import Product from "./Product";
import Payment from "./Payment";
import { React, useState } from "react";

export default function Cart() {

    const [amount, setAmount] = useState(0);

    function addCartValue(productValue){
        setAmount(amount + productValue);
    }

    return (
        <div>
            <p>Products:</p>
            <Product id={0} addCartValue={addCartValue}/>
            <Product id={1} addCartValue={addCartValue}/>
            <Product id={2} addCartValue={addCartValue}/>

            <br/>
            <p>Payment info:</p>
            <Payment amount={amount}/>
        </div>
    );
}