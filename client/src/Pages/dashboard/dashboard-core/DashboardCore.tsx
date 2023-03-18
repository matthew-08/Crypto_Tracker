import { useState, useEffect } from 'react';
import { Blocks } from 'react-loader-spinner';
import styles from './dashboardcore.module.css';
import { DashboardBottom } from './dashboard-core-bottom/DashboardBottom';
import {
  UserInfo,
  CoinData,
  Transaction,
  ServerCoin,
  DetailedCoinData,
} from '../../../types/types';
import { DashboardGraph } from './dashboard-graph/DashboardGraph';
import currencyAdjust from '../../../utils/currencyAdjust';
import { Cards } from './Cards/Cards';
import { SearchBar } from '../components/searchbar/SearchBar';
import Notification from './Notification/Notification';
import bell from '../assets/bell.svg';
import friend from '../assets/friend.svg';
import message from '../assets/message.svg';
import setting from '../assets/settings.svg';
import { Overlay } from '../../../Components/Overlay/Overlay';
import { CoinDetails } from '../../../Components/CoinDetails/CoinDetails';
import { fetchCoin } from '../../../apiCalls/fetchCoin';
import coinHandler from '../../../utils/coinsHandler';

const combineTransactions = (transactions: Transaction[], coinId: string) =>
  transactions.filter(({ coin }) => coin === coinId);

export default function DashboardCore({
  userInfo,
  reRenderUser,
}: {
  userInfo: UserInfo;
  reRenderUser: () => Promise<void>;
}) {
  const [userCoins, setUserCoins] = useState([] as CoinData[]);
  const [overlay, setOverlay] = useState(false);
  const [coinData, setCoinData] = useState({} as DetailedCoinData);

  const fetchCoins = async () => {
    try {
      const { coins } = userInfo;
      const result: CoinData[] = [];
      const res = await Promise.all(
        coins.map((c) =>
          fetch(
            `https://api.coingecko.com/api/v3/coins/${c}?localization=false&tickers=false&market_data=true&developer_data=true`
          )
        )
      );
      const resJson = await Promise.all(res.map((c) => c.json())).then(
        (response) =>
          response.forEach((c) => {
            const cData: CoinData = {
              name: c.name,
              id: c.id,
              symbol: c.symbol.toUpperCase(),
              image: c.image.large,
              marketData: {
                current: currencyAdjust(c.market_data.current_price.usd),
                low24: currencyAdjust(c.market_data.low_24h.usd),
                high24: currencyAdjust(c.market_data.high_24h.usd),
                capPercentage: c.market_data.market_cap_change_percentage_24h,
              },
              transactions: combineTransactions(userInfo.transactions, c.id),
            };
            result.push(cData);
            setUserCoins(result);
          })
      );
    } catch (error) {
      console.log(error);
    }
  };

  const handleOverlay = async (coin: ServerCoin | false) => {
    if (typeof coin === 'boolean') {
      return setOverlay(false);
    }
    if (!overlay) {
      const fetchedCoinData = await fetchCoin(coin);
      setOverlay(true);
      return setCoinData(fetchedCoinData);
    }
    return setOverlay(false);
  };

  useEffect(() => {
    if (userInfo.coins) {
      fetchCoins();
    }
  }, [userInfo]);

  const addToCoinList = async (coinId: string | number) => {
    coinHandler({
      coinId,
      mainPath: 'coins',
    }).then((res) => {
      setOverlay(false);
      reRenderUser();
    });
  };

  return (
    <section className={styles.core}>
      {overlay && (
        <Overlay>
          <CoinDetails
            closeOverlay={handleOverlay}
            addToCoinList={addToCoinList}
            coinDetails={coinData}
          />
        </Overlay>
      )}
      <header className={styles.header}>
        <SearchBar setOverlay={handleOverlay} />
        <ul className={styles.links}>
          <li>Home</li>
          <li>Community</li>
          <li>Discover</li>
          <li>News</li>
        </ul>
        <div className={styles.notifications}>
          <Notification img={bell} amountDisplay={4} />
          <Notification img={message} />
          <Notification img={friend} />
          <Notification img={setting} />
        </div>
      </header>
      <DashboardBottom
        userCoins={userCoins}
        addToCoinList={addToCoinList}
        userTransactions={userInfo.transactions}
        updateUser={reRenderUser}
      />
      <section className={styles['section-mid']}>
        {userCoins.length >= 1 ? (
          <DashboardGraph coinToGraph={userCoins[0].name} />
        ) : (
          <Blocks width="100%" height="250" color="blue" />
        )}
        <Cards userCoins={userCoins} />
      </section>
    </section>
  );
}
