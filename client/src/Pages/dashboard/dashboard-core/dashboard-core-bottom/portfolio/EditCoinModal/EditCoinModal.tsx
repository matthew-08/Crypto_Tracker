import React from 'react';
import { v4 as uuid } from 'uuid';
import { dateFormat } from 'dateformat';
import styles from './editcoinmodal.module.css';
import { CoinData, Transaction } from '../../../../../../types/types';
import edit from '../assets/edit.svg';
import trash from '../assets/trash.svg';

interface ModalProps {
  coinData: CoinData;
  closeOverlay: (arg: 'editCoin') => void;
  handleEdit: (transactionId: Transaction) => void;
}

export default function EditCoinModal({
  coinData,
  closeOverlay,
  handleEdit,
}: ModalProps) {
  const handleDelete = async (arg: Transaction) => {};
  return (
    <div className={styles.modal}>
      <header className={styles.header}>
        <div className={styles['header-top']}>
          <h1>
            Transactions
            <br />
          </h1>
          <button
            type="button"
            className={styles['exit-button']}
            onClick={() => closeOverlay('editCoin')}
          >
            &#215;
          </button>
        </div>
        <div className={styles['coin-name']}>
          <span>{coinData.name}</span>
          <img src={coinData.image} alt="coin" />
        </div>
        <div className={styles['transactions-container']}>
          {coinData.transactions && coinData.transactions.length > 0 ? (
            <div className={styles['table-container']}>
              <table className={styles['edit-table']} id={styles['edit-table']}>
                <thead>
                  <tr>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Date</td>
                    <td>Total</td>
                    <td>Notes</td>
                    <td>Actions</td>
                  </tr>
                </thead>
                <tbody>
                  {' '}
                  {coinData.transactions.map((transaction) => (
                    <tr key={uuid()}>
                      <td>{transaction.price}</td>
                      <td>{transaction.quantity}</td>
                      <td>{dateFormat(transaction.date, 'fullDate')}</td>
                      <td>
                        {Number(transaction.price) *
                          Number(transaction.quantity)}
                      </td>
                      <td>{transaction.note}</td>
                      <td>
                        <button
                          type="button"
                          className={styles['icon-btn']}
                          onClick={() => handleEdit(transaction)}
                        >
                          <img src={edit} alt="edit" />
                        </button>
                        <button
                          type="button"
                          className={styles['icon-btn']}
                          onClick={() => handleDelete(transaction)}
                        >
                          <img src={trash} alt="trash" />
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ) : (
            <div>
              <p>No transactions found for {coinData.name}</p>
            </div>
          )}
        </div>
      </header>
    </div>
  );
}
