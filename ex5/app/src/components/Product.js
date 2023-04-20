import Server from "./Server";

export default function Product({id, addCartValue}) {
    const info = Server.GetProductInfo(id);

    addCartValue(info.price);

    return (
        <div>
            <p>I'm a product!</p>
            <p>Name: {info.name}</p>
            <p>Price: {info.price}</p>
            <p>In stock: {info.availability}</p>
        </div>
      
    );
}