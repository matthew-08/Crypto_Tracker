import styles from './notification.module.css';

export default function Notification({
  img,
  amountDisplay = null,
}: {
  img: string;
  // eslint-disable-next-line react/require-default-props
  amountDisplay?: number | null;
}) {
  return (
    <div className={styles.container}>
      {amountDisplay && (
        <div className={styles.amount}>
          {amountDisplay && <span>{amountDisplay}</span>}
        </div>
      )}
      <img src={img} alt="img" />
    </div>
  );
}
