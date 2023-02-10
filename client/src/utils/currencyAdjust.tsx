import React from 'react';
import { stringify } from 'uuid';

const currencyAdjust = (price: number | null): string => {
  if (typeof price !== 'number') {
    return '0';
  }
  const priceToString = price.toString();
  const hasDecimal = priceToString.includes('.');
  let index;
  let counter = 0;
  const priceToArray = priceToString.split('');
  if (hasDecimal) {
    index = priceToArray.indexOf('.') - 1;
  } else {
    index = priceToArray.length - 1;
  }
  while (index !== 0) {
    counter += 1;
    index -= 1;
    if (counter === 2) {
      priceToArray.splice(index, 0, ',');
      counter = 0;
      index -= 1;
    }
  }
  priceToArray.splice(0, 0, '$');
  return priceToArray.join('');
};

export default currencyAdjust;
