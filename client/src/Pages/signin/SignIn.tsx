import React from 'react'
import { WavePage } from '../../Components/wavePage/WavePage'
import { FormComponent } from '../../Components/FormComponent/FormComponent'
import { useState } from 'react'
export const SignIn = () => {
    const [error, setError] = useState('')
    const handleSignIn = () => {
        return Promise
    }
  return (
    <WavePage
    >
    <FormComponent
    buttonText='Sign In'
    smallTextBottom='Forgot your password?'
    headerSubtitle='Please sign in below'
    formInputFields={['Email', 'Username', 'Password']}
    header='Sign-In'
    linkPath='/ok'
    errorMessage={error}
    apiCallback={handleSignIn}
    key={2}
    />
    </WavePage>
  )
}
