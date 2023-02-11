import React, { useReducer } from 'react';
import { v4 as uuid } from 'uuid';
import { Input } from '../../../../../../Components/Input/Input';
import { CoinData, ReducerProps } from '../../../../../../types/types';
import styles from './modal.module.css';

const ACTIONS = {
  PRICE: 'price',
  QUANTITY: 'quantity',
  DATE: 'date',
} as const;

type Keys = keyof typeof ACTIONS;

type Actions = typeof ACTIONS[Keys];

const reducerFunc = (state: ReducerProps, action: { type: Actions, payload: string }) => {
  switch (action.type) {
    case ACTIONS.PRICE:
      return { ...state, price: action.payload };
    case ACTIONS.DATE:
      return { ...state, date: action.payload };
    case ACTIONS.QUANTITY:
      return { ...state, quantity: action.payload };
    default:
      return state;
  }
};

export function AddCoinModal({ coinData }:{ coinData: CoinData }) {
  const [state, dispatch] = useReducer(reducerFunc, {
    price: '',
    quantity: '',
    date: '',
  } as ReducerProps);

  const updateField = (type: Actions, payload: string) => {
    dispatch({
      type,
      payload,
    });
    console.log(state);
  };
  return (
    <div
      className={styles.modal}
    >
      <header
        className={styles.header}
      >
        <h1>Add Transaction</h1>
      </header>
      <section
        className={styles['inputs-container']}
      >
        <Input
          date={false}
          labelText="Price Per Coin"
          type="price"
          sendInput={updateField}
          key="price"
          value={state.price}
        />
        <Input
          date={false}
          labelText="Quantity"
          type="quantity"
          sendInput={updateField}
          key="quantity"
          value={state.quantity}
          coinType={coinData.symbol}
        />
        <input
          type="text"
          disabled
          value={state.quantity && state.price ? state.quantity * state.price : ''}
        />
      </section>

    </div>
  );
}
