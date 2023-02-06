export interface UserInfo {
  user_name: string,
  email: string
}
export type ButtonObject = {
  buttonText: string,
  image: string,
};
export type DropdownButtons = ButtonObject[];

interface MarketData {
  current: number | string,
  low24: number | string,
  high24: number | string,
  capPercentage: number | string,
}

export interface CoinData {
  name: string | number,
  id: string | number,
  symbol: string,
  image: string,
  marketData: MarketData
}
