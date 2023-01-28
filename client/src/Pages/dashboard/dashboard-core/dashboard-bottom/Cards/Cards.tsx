import React from 'react'
import styles from './cards.module.css'
import { useEffect, useState } from 'react'
import currencyAdjust from '../../../../../utils/currencyAdjust'

interface MarketData {
    current: number | string,
    low24: number | string,
    high24: number | string,
}

interface CoinData {
    name: string | number,
    id: string | number,
    symbol: string,
    image: string,
    marketData: MarketData
}

export const Cards = () => {

    const [userCoins, setUserCoins] = useState<CoinData[]>([])

    useEffect(() => {
        const defaultCoins = ['bitcoin', 'ethereum', 'dogecoin']
        const fetchCoins = async () => {
            try {
                let result:CoinData[] = []
                const res = 
                await Promise.all(defaultCoins.map(c => 
                    fetch(`https://api.coingecko.com/api/v3/coins/${c}?localization=false&tickers=false&market_data=true&developer_data=true`)))
                const resJson = await Promise.all(res.map(c => c.json()))
                .then(res => res.forEach(c => {
                    const coinData: CoinData = {
                        name: c.name,
                        id: c.id,
                        symbol: c.symbol,
                        image: c.image.large,
                        marketData: {
                            current: c.market_data.current_price.usd,
                            low24: c.market_data.low_24h.usd,
                            high24: c.market_data.high_24h.usd,
                        }
                    }
                   /*  for (const [key, value] of Object.entries(coinData.marketData)){
                        coinData.marketData[key] = currencyAdjust(value);
                    } */
                    result.push(coinData)
                    setUserCoins(result)
                }))
                const coinData = {
                    name: resJson
                    //market_data.current_price.usd = current price
                    //low24 market_data.low_24.usd
                    //high24 
                    //
                }
                
            } catch (error) {
                
            }
        }
        fetchCoins()
    },[])

    useEffect(() => {
        console.log(userCoins)
    }, [userCoins])

  return (
    <section
    className={styles.cards}
    >

    </section>
  )
}
