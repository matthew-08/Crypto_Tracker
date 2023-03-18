import { CoinId, Transaction } from '../types/types';
import apiURL from './apiURL';

type PostTransaction = {
  type: 'post';
  body: {
    price: string;
    quantity: string;
    date: string;
    note: string;
    coin: CoinId;
  };
};
const HTTPVerbs = {
  post: 'POST',
  update: 'PUT',
};

type UpdateTransction = {
  type: 'update';
  body: {
    price: string;
    quantity: string;
    date: string;
    note: string;
    transaction_id: string;
  };
};

type Arg = PostTransaction;
const postTransaction = async (arg0: PostTransaction) => {
  await fetch(`${apiURL}/transactions`, {
    credentials: 'include',
    method: HTTPVerbs[arg0.type],
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(arg0.body),
  });
};

const updateTranasction = async ({ body, type }: UpdateTransction) => {
  // eslint-disable-next-line @typescript-eslint/naming-convention
  const { date, note, price, quantity, transaction_id } = body;
  await fetch(
    `${apiURL}/transactions?transactionId=${transaction_id}
    &quantity=${quantity}&note=${note}&date=${date}&price=${price}`,
    {
      credentials: 'include',
      method: HTTPVerbs[type],
    }
  );
};

const deleteTransaction = async (arg0: Transaction['transaction_id']) => {
  await fetch(`${apiURL}/transactions?transactionId=${arg0}`, {
    credentials: 'include',
    method: 'DELETE',
  });
};

export { postTransaction, updateTranasction, deleteTransaction };
