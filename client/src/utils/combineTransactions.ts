import { Transaction } from '../types/types';

const combineTransactions = (transactions: Transaction[], coinId: string) =>
  transactions.filter(({ coin }) => coin === coinId);

export default combineTransactions;
