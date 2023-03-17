const userInfoSchema = (transactions, coins, user_name, email ) => {
    return { 
        transactions,
        coins,
        user_name,
        email,
    }
}

module.exports = userInfoSchema