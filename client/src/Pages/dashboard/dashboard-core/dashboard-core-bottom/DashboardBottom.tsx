import { useState } from 'react';
import styles from './dashboardbottom.module.css';
import {
  CoinData,
  ServerCoin,
  DetailedCoinData,
  Transaction,
} from '../../../../types/types';
import { Overlay } from '../../../../Components/Overlay/Overlay';
import { CoinDetails } from '../../../../Components/CoinDetails/CoinDetails';
import { Portfolio } from './portfolio/Portfolio';
import { fetchCoinDetails } from '../../../../utils/coinsHandler';

export function DashboardBottom({
  userCoins,
  addToCoinList,
  userTransactions,
  updateUser,
}: {
  userCoins: CoinData[];
  addToCoinList: (coindId: string | number) => Promise<void>;
  userTransactions: Transaction[];
  updateUser: () => Promise<void>;
}) {
  const [overlay, setOverlay] = useState(false);
  const [coinData, setCoinData] = useState({} as DetailedCoinData);

  // eslint-disable-next-line consistent-return
  const handleOverlay = async (coin: ServerCoin | false) => {
    if (typeof coin === 'boolean') {
      return 'ok';
    }
    if (!overlay) {
      const obj = await fetchCoinDetails(coin);
      setOverlay(true);
      return setCoinData(obj);
    }
    return setOverlay(false);
  };

  return (
    <>
      {overlay && (
        <Overlay>
          <CoinDetails
            coinDetails={coinData}
            closeOverlay={() => setOverlay(false)}
            addToCoinList={addToCoinList}
          />
        </Overlay>
      )}
      <section className={styles['dashboard-bottom']}>
        <div className={styles['main-container']}>
          <div className={styles.portfolio}>
            <Portfolio
              userCoins={userCoins}
              userTransactions={userTransactions}
              updateUser={updateUser}
            />
          </div>
        </div>
      </section>
    </>
  );
}
