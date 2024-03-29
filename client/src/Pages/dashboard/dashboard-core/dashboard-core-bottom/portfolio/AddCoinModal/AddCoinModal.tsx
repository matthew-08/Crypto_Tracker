import { useEffect, useReducer, useState } from 'react';
import { Input } from '../../../../../../Components/Input/Input';
import {
  CoinData,
  ReducerProps,
  Transaction,
} from '../../../../../../types/types';
import {
  postTransaction,
  updateTranasction,
} from '../../../../../../utils/transactionHandler';
import styles from './modal.module.css';

const ACTIONS = {
  PRICE: 'price',
  QUANTITY: 'quantity',
  DATE: 'date',
  NOTE: 'note',
  SETALLFIELDS: 'setAllFields',
} as const;

type Keys = keyof typeof ACTIONS;

type MirrorObject = typeof ACTIONS;

type ActionTypes = MirrorObject[Keys];

type OmitSetAllFields = 'price' | 'quantity' | 'date' | 'note';

type UpdateActions = {
  type: OmitSetAllFields;
  payload: string;
};

type SetAllFields = {
  type: 'setAllFields';
  payload: Transaction;
};

type Actions = UpdateActions | SetAllFields;

type OmitNote = Omit<ReducerProps, 'note'>;
type KeyOfInvalidInput = keyof OmitNote;
type InvalidInput = Record<keyof OmitNote, boolean>;

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
    case ACTIONS.SETALLFIELDS:
      return {
        ...state,
        note: action.payload.note,
        date: action.payload.date,
        quantity: action.payload.quantity,
        price: action.payload.price,
      };
    default:
      return state;
  }
}

export function AddCoinModal({
  coinData,
  closeOverlay,
  transaction,
}: {
  coinData: CoinData;
  closeOverlay: (arg: 'addCoin') => void;
  // eslint-disable-next-line react/require-default-props
  transaction?: Transaction | null;
}) {
  const [haveTransaction, setHaveTransaction] = useState(false);
  const [state, dispatch] = useReducer(reducerFunc, {
    price: '',
    quantity: '',
    date: '',
    note: '',
  } as ReducerProps);
  const [invalidInput, setInvalidInput] = useState({
    price: false,
    date: false,
    quantity: false,
  } as InvalidInput);

  // useEffect hook that sets state if the transaciton variable is available
  useEffect(() => {
    if (transaction) {
      setHaveTransaction(() => true);
      dispatch({
        type: 'setAllFields',
        payload: transaction,
      });
    }
  }, []);

  const updateField = (type: OmitSetAllFields, payload: string) => {
    dispatch({
      type,
      payload,
    });
  };

  const handleSubmit = async () => {
    type StateProperties = keyof typeof state;
    const requiredFields = Object.keys(state) as StateProperties[];
    const filterNote: KeyOfInvalidInput[] = requiredFields.filter(
      (key) => key !== 'note'
    ) as KeyOfInvalidInput[];

    const checkFields = filterNote.filter((prop) => state[prop] === '');
    if (checkFields.length === 0) {
      if (!transaction) {
        await postTransaction({
          body: {
            ...state,
            coin: coinData.id,
          },
          type: 'post',
        }).then(() => closeOverlay('addCoin'));
      } else {
        await updateTranasction({
          body: {
            ...state,
            transaction_id: transaction.transaction_id,
          },
          type: 'update',
        }).then(() => closeOverlay('addCoin'));
      }
    } else {
      Object.keys(invalidInput).forEach((key) => {
        setInvalidInput((prev) => ({ ...prev, [key]: false }));
      });
      checkFields.forEach((field) => {
        setInvalidInput((prev) => ({ ...prev, [field]: true }));
      });
    }
  };

  return (
    <div className={styles.modal}>
      <header className={styles.header}>
        <h1>{transaction ? 'Edit' : 'Add'} Transaction</h1>
      </header>
      <section className={styles['inputs-container']}>
        <Input
          date={false}
          labelText="Price Per Coin"
          type="price"
          sendInput={updateField}
          key="price"
          value={state.price}
          inputType="number"
          invalid={invalidInput.price}
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
          invalid={invalidInput.quantity}
        />
        <label htmlFor="text" className={styles.label}>
          <span className={styles.usd}>USD $</span>
          Total
          <input
            type="text"
            disabled
            className={styles['total-container']}
            value={
              state.quantity && state.price
                ? Number(state.quantity) * Number(state.price)
                : ''
            }
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
          invalid={invalidInput.date}
        />
        <Input
          labelText="Note (optional)"
          sendInput={updateField}
          value={state.note}
          key="Note"
          type="note"
          date={false}
          inputType="text"
          invalid={false}
        />
        <div className={styles['buttons-container']}>
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
