import React, { useReducer } from 'react';
import { v4 as uuid } from 'uuid';
import { Input } from '../../../../../../Components/Input/Input';
import { CoinData, ReducerProps } from '../../../../../../types/types';
import styles from './modal.module.css';
import { TransactionNote } from './TransactionNote/TransactionNote';

const ACTIONS = {
  PRICE: 'price',
  QUANTITY: 'quantity',
  DATE: 'date',
  NOTE: 'note',
} as const;

type Keys = keyof typeof ACTIONS;

type MirrorObject = typeof ACTIONS;

type ActionTypes = MirrorObject[Keys];

type Actions = {
  type: ActionTypes,
  payload: string
};
function reducerFunc(state: ReducerProps, action: Actions) {
  switch (action.type) {
    case ACTIONS.PRICE:
      return { ...state, price: action.payload };
    case ACTIONS.DATE:
      return { ...state, date: action.payload };
    case ACTIONS.QUANTITY:
      return { ...state, quantity: action.payload };
    case ACTIONS.NOTE:
      return { ...state, note: action.payload };
    default:
      return state;
  }
}

export function AddCoinModal({ coinData }:{ coinData: CoinData }) {
  const [state, dispatch] = useReducer(reducerFunc, {
    price: '',
    quantity: '',
    date: '',
    note: '',
  });

  const updateField = (type: ActionTypes, payload: string) => {
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
        <label
          htmlFor="text"
          className={styles.label}
        >
          <span
            className={styles.usd}
          >
            USD
            {' '}
            $
          </span>
          Total
          <input
            type="text"
            disabled
            className={styles['total-container']}
            value={state.quantity && state.price ? Number(state.quantity) * Number(state.price) : ''}
          />
        </label>
        <Input
          date
          labelText="Date:"
          sendInput={updateField}
          type="date"
          value={state.date}
          key="Date"
        />
        <Input
          labelText="Note (optional)"
          sendInput={updateField}
          value={state.note}
          key="Note"
          type="note"
          date={false}
        />
        <div
          className={styles['buttons-container']}
        >
          <button
            type="button"
            className={styles['cancel-button']}
          >
            Cancel
          </button>
          <button
            type="button"
            className={styles['submit-button']}
          >
            Submit
          </button>
        </div>
      </section>

    </div>
  );
}
