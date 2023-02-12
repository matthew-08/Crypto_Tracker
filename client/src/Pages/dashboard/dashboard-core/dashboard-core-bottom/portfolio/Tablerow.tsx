import React, { useState } from 'react';
import styles from './portfolio.module.css';
import add from './assets/add.svg';
import trash from './assets/trash.svg';
import edit from './assets/edit.svg';
import { Overlay } from '../../../../../Components/Overlay/Overlay';
import { AddCoinModal } from './AddCoinModal/AddCoinModal';

import { CoinData } from '../../../../../types/types';

type OverlayOptions = {
  addCoin: boolean,
  editCoin: boolean,
};

export function Tablerow({ coinData }:{ coinData: CoinData }) {
  const [overlay, setOverlay] = useState<OverlayOptions>({
    addCoin: false,
    editCoin: false,
  });

  const handleOverlay = (option: keyof OverlayOptions) => {
    switch (option) {
      case 'addCoin':
        setOverlay({ ...overlay, addCoin: !overlay.addCoin });
        break;
      case 'editCoin':
        setOverlay({ ...overlay, editCoin: !overlay.editCoin });
        break;
      default:
        ((x: never) => {
          throw new Error(`${x} was unhandled!`);
        })(option);
    }
  };

  const closeOverlay = (options: keyof OverlayOptions) => {
    if (options === 'editCoin') {
      setOverlay({ ...overlay, editCoin: false });
    } else {
      setOverlay({ ...overlay, addCoin: false });
    }
  };
  return (
    <>
      {
      (overlay.addCoin || overlay.editCoin)
    && (
    <Overlay>
      <AddCoinModal
        coinData={coinData}
        closeOverlay={closeOverlay}
      />
    </Overlay>
    )
    }
      <tr>
        <td
          className={styles['coin-name-dt']}
        >
          <img src={coinData.image} alt="coin-img" />
          {coinData.name}
          <small>{coinData.symbol.toUpperCase()}</small>
        </td>
        <td>
          {coinData.marketData.current}
        </td>
        <td>
          1.2404t
        </td>
        <td
          className={styles.buttons}
        >
          <button
            type="button"
            onClick={() => handleOverlay('addCoin')}
          >
            <img src={add} alt="" />
          </button>
          <button
            type="button"
            onClick={() => handleOverlay('editCoin')}
          >
            <img src={edit} alt="" />
          </button>
          <button
            type="button"
          >
            <img src={trash} alt="" />
          </button>
        </td>
      </tr>
    </>
  );
}
