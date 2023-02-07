export interface UserInfo {
  user_name: string,
  email: string
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

export interface DetailedMarketData extends SimpleMarketData {
  marketCap: string | number,
  volume: string | number,
  usd1h: string | number,
  usd24h: string | number,
  usd7d: string | number,
  usd30d: string | number,
  description: string,
  links: {
    facebook: string,
    twitter: string,
    reddit: string,
  }
  socialMediaStats: {
    twitterFollowers: number | null,
    redditSubscribers: number | null,
    facebookLikes: number | null
  }
  totalSupply: string | number,
  maxSupply: string | number

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
