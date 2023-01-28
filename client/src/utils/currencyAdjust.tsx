import React from 'react'

const currencyAdjust = (price: number): string => {
    const priceToString = price.toString()
    console.log(priceToString)
    const hasDecimal = priceToString.includes('.')
    let index
    let counter = 0
    const priceToArray = priceToString.split('')
    if(hasDecimal) {
        index = priceToArray.indexOf('.') - 1
    }
    else {
        index = priceToArray.length - 1
    }
    while (index !== 0) {
        counter += 1
        index -= 1
        if(counter === 2) {
            priceToArray.splice(index, 0, ',')
            counter = 0
            index -=1
        }   
    }
    priceToArray.splice(0, 0, '$')
    return priceToArray.join('')   
}

export default currencyAdjust
