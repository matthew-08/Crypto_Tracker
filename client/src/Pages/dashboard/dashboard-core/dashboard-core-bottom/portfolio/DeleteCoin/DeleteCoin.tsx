import React from 'react';
import { CoinData } from '../../../../../../types/types';
import styles from './deletecoin.module.css';

interface Props {
  closeOverlay: (arg0: 'delete') => void;
  coin: CoinData;
}

export default function DeleteCoin({ closeOverlay, coin }: Props) {
  return (
    <section className={styles.modal}>
      <h1>Delete Coin</h1>
      <p>*You are about to delete {coin.name} from your collection</p>
      <p>This will remove all associated transactions from your history</p>
      <p>Click confirm to continue</p>
      <div className={styles['button-grp']}>
        <button type="submit" onClick={() => closeOverlay('delete')}>
          Cancel
        </button>
        <button type="submit">Confirm</button>
      </div>
    </section>
  );
}
