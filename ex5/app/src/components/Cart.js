import Product from "./Product";
import Payment from "./Payment";
import { React, useEffect, useState } from "react";

import Server from "./Server";

export default function Cart() {

    const [amount, setAmount] = useState(0);

    const products = [
        Server.GetProductInfo(0),
        Server.GetProductInfo(1),
        Server.GetProductInfo(2)
    ];

    let totalAmount = 0;
    products.forEach(product => { totalAmount += product.price; });
    console.log(totalAmount);
    useEffect(() => { setAmount(totalAmount); }, [])

    console.log(products);
    return (
        <div>
            <p>Products:</p>
            {products.map(product => (
                <Product price={product.price} availability={product.availability} name={product.name} key={product.id} />
            ))}

            <br />
            <p>Payment info:</p>
            <Payment amount={amount} />
        </div>
    );
}