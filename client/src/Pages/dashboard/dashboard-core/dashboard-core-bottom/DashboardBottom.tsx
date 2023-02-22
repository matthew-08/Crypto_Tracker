import React, { useState } from 'react';
import styles from './dashboardbottom.module.css';
import { SearchBar } from '../../components/searchbar/SearchBar';
import {
  CoinData, ServerCoin, DetailedCoinData, Transaction,
} from '../../../../types/types';
import { Overlay } from '../../../../Components/Overlay/Overlay';
import { Coin } from '../../components/searchbar/types/types';
import { CoinDetails } from '../../../../Components/CoinDetails/CoinDetails';
import graph from './assets/graph.svg';
import { Portfolio } from './portfolio/Portfolio';
import EditCoinModal from './portfolio/EditCoinModal/EditCoinModal';

export function DashboardBottom({
  userCoins,
  addToCoinList,
  userTransactions,
  updateUser,
  focusSearchBar,
}: { userCoins: CoinData[],
  addToCoinList: (coindId: string | number) => Promise<void>,
  userTransactions: Transaction[],
  updateUser: () => Promise<void>,
  focusSearchBar: () => void
}) {
  const [overlay, setOverlay] = useState(false);
  const [coinData, setCoinData] = useState({} as DetailedCoinData);

  // eslint-disable-next-line consistent-return
  const handleOverlay = async (coin:ServerCoin | false) => {
    if (typeof coin === 'boolean') {
      return 'ok';
    }
    if (!overlay) {
      const fetchCoin = await fetch(`https://api.coingecko.com/api/v3/coins/${coin.coin_id}`).then((res) => res.json())
        .then((res: Record<string, any>) => {
          const obj:DetailedCoinData = {
            id: res.id,
            image: res.image.large,
            name: res.name,
            symbol: res.symbol,
            marketData: {
              capPercentage: '',
              current: res.market_data.current_price.usd,
              description: res.description,
              high24: res.market_data.high_24h.usd,
              low24: res.market_data.low_24h.usd,
              links: {
                facebook: res.links.facebook_username,
                reddit: res.links.subreddit_url,
                twitter: res.links.twitter_screen_name,
              },
              marketCap: res.market_data.market_cap.usd,
              maxSupply: res.market_data.max_supply,
              socialMediaStats: {
                facebookLikes: res.community_data.facebook_likes,
                redditSubscribers: res.community_data.reddit_subscribers,
                twitterFollowers: res.community_data.twitter_followers,
              },
              totalSupply: res.market_data.total_supply,
              percent1h: {
                btc: res.market_data.price_change_percentage_1h_in_currency.btc,
                eth: res.market_data.price_change_percentage_1h_in_currency.eth,
                usd: res.market_data.price_change_percentage_1h_in_currency.usd,
              },
              percent24h: {
                btc: res.market_data.price_change_percentage_24h_in_currency.btc,
                eth: res.market_data.price_change_percentage_24h_in_currency.eth,
                usd: res.market_data.price_change_percentage_24h_in_currency.usd,
              },
              percent30d: {
                btc: res.market_data.price_change_percentage_30d_in_currency.btc,
                eth: res.market_data.price_change_percentage_30d_in_currency.eth,
                usd: res.market_data.price_change_percentage_30d_in_currency.usd,
              },
              percent7d: {
                btc: res.market_data.price_change_percentage_7d_in_currency.btc,
                eth: res.market_data.price_change_percentage_7d_in_currency.eth,
                usd: res.market_data.price_change_percentage_7d_in_currency.usd,
              },
              volume: res.market_data.total_volume.usd,
              allTimeHigh: res.market_data.ath.usd,
              allTimeLow: res.market_data.atl.usd,
              circulating_supply: res.market_data.circulating_supply,
              market_cap_change_percentage_24h: res.market_cap_change_percentage_24h,
            },
          };
          setOverlay(true);
          return setCoinData(obj);
        });
    } else {
      return setOverlay(false);
    }
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
      ) }
      <section
        className={styles['dashboard-bottom']}
      >
        <div
          className={styles['main-container']}
        >

          <div
            className={styles.portfolio}
          >
            <Portfolio
              userCoins={userCoins}
              userTransactions={userTransactions}
              updateUser={updateUser}
              focusSearchBar={focusSearchBar}
            />
          </div>
          {/* <div
            className={styles['recent-transactions']}
          >
            <EditCoinModal
              closeOverlay={setOverlay}
              coinData={coinData}

            />
          </div> */}
        </div>
      </section>
    </>
  );
}
