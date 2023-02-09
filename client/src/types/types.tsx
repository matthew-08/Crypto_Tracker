export interface UserInfo {
  user_name: string,
  email: string,
  coins: string[],
}
export type ButtonObject = {
  buttonText: string,
  image: string,
};
export type DropdownButtons = ButtonObject[];
interface SimpleMarketData {
  current: number | string,
  low24: number | string,
  high24: number | string,
  capPercentage: number | string,
}

export type PercentageCoins = {
  btc: string | number,
  eth: string | number,
  usd: string | number,
};

export interface DetailedMarketData extends SimpleMarketData {
  marketCap: number,
  volume: number,
  percent1h: PercentageCoins,
  percent24h: PercentageCoins,
  percent7d: PercentageCoins,
  percent30d: PercentageCoins,
  description: string,
  links: {
    facebook: string,
    twitter: string,
    reddit: string,
  }
  socialMediaStats: {
    twitterFollowers: number | null,
    redditSubscribers: number | null,
    facebookLikes: number | null,
  }
  totalSupply: number,
  maxSupply: number,
  allTimeHigh: string | number,
  allTimeLow: string | number,
  circulating_supply: number,
  market_cap_change_percentage_24h: string | number,

}

export interface BaseCoinInfo {
  name: string
  id: string | number,
  symbol: string,
  image: string,
}

export interface CoinData extends BaseCoinInfo {
  marketData: SimpleMarketData
}

export interface DetailedCoinData extends BaseCoinInfo {
  marketData: DetailedMarketData
}

export type ServerCoin = {
  coin_id: string,
  coin_symbol: string,
  coin_name: string,
};

export type ServerResponse = {
  rows: ServerCoin[]
};

export type ParsedCoins = ServerResponse;

export interface MarketPercentage {
  label: string,
  percentage: string | number,
  type: 'number' | 'percentage'
}
