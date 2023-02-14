import React, { useEffect, useState } from 'react';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Filler,
  Legend,
} from 'chart.js';
import { Line } from 'react-chartjs-2';
import moment from 'moment';
import styles from './dashboardgraph.module.css';
import useWindowDimensions from '../../../../Components/Hooks/useWindowDimensions';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Filler,
  Legend,
);

type ChartData = {
  x: number,
  y: string
};
ChartJS.defaults.color = '#fff';
ChartJS.defaults.font.size = 16;

export function DashboardGraph({ coinToGraph }: { coinToGraph: string }) {
  const { height, width } = useWindowDimensions();

  const [chartData, setChartData] = useState([] as ChartData[]);
  const fetchMarkChartData = async () => {
    const coinToFetch = coinToGraph;
    if (typeof coinToFetch === 'string') {
      coinToFetch.toLowerCase();
    }
    const marketChartData = await fetch(`https://api.coingecko.com/api/v3/coins/${coinToFetch.toLowerCase()}/market_chart?vs_currency=usd&days=7&interval=daiy`);
    const parsedData = await marketChartData.json();
    const reducedChartData:ChartData[] = await parsedData.prices
      .map((value:{ [key: string]: number }) => (
        { x: value[0], y: value[1].toFixed(2) }
      ));
    await console.log(reducedChartData);
    setChartData(reducedChartData);
  };

  useEffect(() => {
    fetchMarkChartData();
  }, []);
  const options = {
    responsive: true,
  };

  const data = {
    labels: chartData.map((value) => moment(value.x).format('MMMM Do')),
    datasets: [
      {
        label: coinToGraph,
        fill: true,
        data: chartData.map((val) => val.y),
        borderColor: 'rgb(53, 162, 235)',
      },
    ],
  };

  return (
    <section
      className={styles.container}
    >
      {
        chartData
        && (
        <Line
          options={options}
          data={data}
        />
        )
}
    </section>
  );
}
