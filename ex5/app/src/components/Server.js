

export function SendPaymentInfo(amount){
    console.log(`Sending payment info. Amoung to pay: ${amount}`);
}

export function GetProductInfo(id){
    return {
        id: id,
        name: `Product Name #${id}`,
        price: id * 467,
        availability: id*10
    }
}

export default {
    SendPaymentInfo,
    GetProductInfo
}