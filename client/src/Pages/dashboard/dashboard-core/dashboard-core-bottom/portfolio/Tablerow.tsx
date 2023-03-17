import React, { useState, version } from 'react';
import styles from './portfolio.module.css';
import add from './assets/add.svg';
import trash from './assets/trash.svg';
import edit from './assets/edit.svg';
import { Overlay } from '../../../../../Components/Overlay/Overlay';
import { AddCoinModal } from './AddCoinModal/AddCoinModal';
import EditCoinModal from './EditCoinModal/EditCoinModal';
import { Transaction, CoinData } from '../../../../../types/types';
import DeleteCoin from './DeleteCoin/DeleteCoin';

type OverlayOptions = {
  addCoin: boolean;
  editCoin: boolean;
  deleteCoin: boolean;
};

const getTransactionTotal = (transactions: Transaction[]) =>
  transactions.reduce((acc, curr) => {
    if (curr.quantity && curr.price) {
      acc += parseInt(curr.quantity * curr.price);
    } else {
      acc += 0;
    }
    return acc;
  }, 0);

export function Tablerow({
  coinData,
  updateUser,
}: {
  coinData: CoinData;
  updateUser: () => Promise<void>;
}) {
  const [overlay, setOverlay] = useState<OverlayOptions>({
    addCoin: false,
    editCoin: false,
    deleteCoin: false,
  });

  const [editTransaction, setTransaction] = useState<null | Transaction>(null);

  const handleOverlay = (option: keyof OverlayOptions) => {
    switch (option) {
      case 'addCoin':
        setOverlay({ ...overlay, addCoin: !overlay.addCoin });
        break;
      case 'editCoin':
        setOverlay({ ...overlay, editCoin: !overlay.editCoin });
        break;
      case 'deleteCoin':
        setOverlay({ ...overlay, deleteCoin: !overlay.deleteCoin });
        break;
      default:
        ((x: never) => {
          throw new Error(`${x} was unhandled!`);
        })(option);
    }
  };

  const closeOverlay = (options: keyof OverlayOptions) => {
    if (options === 'editCoin') {
      setOverlay((prev) => ({ ...prev, editCoin: false }));
    } else {
      setOverlay((prev) => ({ ...prev, addCoin: false }));
    }
    updateUser();
  };

  const handleEdit = (transaction: Transaction) => {
    setOverlay((prev) => ({ ...prev, editCoin: false }));
    setTransaction(transaction);
    // set state transaction variable equal to a transaction
    handleOverlay('addCoin');
    // set addCoinmodal to true
    // render addCoin modal
  };
  return (
    <>
      {(overlay.addCoin || overlay.editCoin) && (
        <Overlay>
          {overlay.addCoin ? (
            <AddCoinModal
              coinData={coinData}
              closeOverlay={closeOverlay}
              transaction={editTransaction && editTransaction}
            />
          ) : (
            <EditCoinModal
              coinData={coinData}
              closeOverlay={closeOverlay}
              handleEdit={handleEdit}
            />
          )}
        </Overlay>
      )}
      {overlay.deleteCoin && (
        <Overlay>
          <DeleteCoin closeOverlay={closeOverlay} coin={coinData} />
        </Overlay>
      )}

      <tr>
        <td className={styles['coin-name-dt']}>
          <img src={coinData.image} alt="coin-img" />
          {coinData.name}
          <small>{coinData.symbol.toUpperCase()}</small>
        </td>
        <td>{coinData.marketData.current}</td>
        <td>{coinData.marketData.low24}</td>
        <td>{coinData.marketData.high24}</td>
        <td>{coinData.transactions?.length || 0}</td>
        <td>
          ${' '}
          {coinData.transactions && getTransactionTotal(coinData.transactions)}
        </td>
        <td className={styles.buttons}>
          <button type="button" onClick={() => handleOverlay('addCoin')}>
            <img src={add} alt="" />
          </button>
          <button type="button" onClick={() => handleOverlay('editCoin')}>
            <img src={edit} alt="" />
          </button>
          <button type="button" onClick={() => handleOverlay('deleteCoin')}>
            <img src={trash} alt="" />
          </button>
        </td>
      </tr>
    </>
  );
}
