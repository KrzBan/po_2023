

export function SendPaymentInfo(amount){
    console.log(`Sending payment info. Amoung to pay: ${amount}`);
}

export function GetProductInfo(id){
    return {
        name: `Product Name #${id}`,
        price: id * 467,
        availability: id*10
    }
}

export default {
    SendPaymentInfo,
    GetProductInfo
}