import React, { useReducer } from 'react';
import { v4 as uuid } from 'uuid';
import { Input } from '../../../../../../Components/Input/Input';
import { CoinData, ReducerProps } from '../../../../../../types/types';
import styles from './modal.module.css';

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

export function AddCoinModal({ coinData, closeOverlay }:{ coinData: CoinData,
  closeOverlay: (arg: 'addCoin') => void }) {
  const [state, dispatch] = useReducer(reducerFunc, {
    price: '',
    quantity: '',
    date: '',
    note: '',
  } as ReducerProps);

  const updateField = (type: ActionTypes, payload: string) => {
    dispatch({
      type,
      payload,
    });
    console.log(state);
  };

  const handleSubmit = async () => {
    type StateProperties = keyof typeof state;
    const requiredFields = Object.keys(state) as StateProperties[];
    const filterNote = requiredFields.filter((key) => key !== 'note');
    const checkFields = filterNote.every((prop) => state[prop] !== '');
    if (checkFields) {
      const postTransaction = await fetch('http://localhost:8000/add/transaction', {
        credentials: 'include',
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          ...state,
          coin: coinData.id,
        }),
      });
    }
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
          inputType="number"
        />
        <Input
          date={false}
          labelText="Quantity"
          type="quantity"
          sendInput={updateField}
          key="quantity"
          value={state.quantity}
          coinType={coinData.symbol}
          inputType="number"
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
          inputType="date"
        />
        <Input
          labelText="Note (optional)"
          sendInput={updateField}
          value={state.note}
          key="Note"
          type="note"
          date={false}
          inputType="text"
        />
        <div
          className={styles['buttons-container']}
        >
          <button
            type="button"
            className={styles['cancel-button']}
            onClick={() => closeOverlay('addCoin')}

          >
            Cancel
          </button>
          <button
            type="button"
            className={styles['submit-button']}
            onClick={handleSubmit}
          >
            Submit
          </button>
        </div>
      </section>

    </div>
  );
}
