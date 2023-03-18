import React from 'react';
import { CoinData } from '../../../../../../types/types';
import coinHandler from '../../../../../../utils/coinsHandler';
import styles from './deletecoin.module.css';

interface Props {
  closeOverlay: (arg0: 'deleteCoin') => void;
  coin: CoinData;
}

export default function DeleteCoin({ closeOverlay, coin }: Props) {
  const handleDelete = async () => {
    await coinHandler({
      coinId: coin.id,
      type: 'delete',
      mainPath: 'coins',
    });
    closeOverlay('deleteCoin');
  };
  return (
    <section className={styles.modal}>
      <h1>Delete Coin</h1>
      <p>*You are about to delete {coin.name} from your collection</p>
      <p>This will remove all associated transactions from your history</p>
      <p>Click confirm to continue</p>
      <div className={styles['button-grp']}>
        <button type="submit" onClick={() => closeOverlay('deleteCoin')}>
          Cancel
        </button>
        <button type="submit" onClick={handleDelete}>
          Confirm
        </button>
      </div>
    </section>
  );
}
