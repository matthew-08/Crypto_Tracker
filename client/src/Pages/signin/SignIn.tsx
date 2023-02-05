import React from 'react'
import { WavePage } from '../../Components/wavePage/WavePage'
import { FormComponent } from '../../Components/FormComponent/FormComponent'
import { useState } from 'react'
import { Navigate, redirect, useNavigate } from 'react-router-dom'


export const SignIn = () => {
  const navigate = useNavigate()
    const [error, setError] = useState('')
    const handleSignIn = async (data:{username: string, password: string, [key: string]: string}) => {
        const {username, password} = data
        const dataToPost = {
          username,
          password
        }
        try {
          const userSignIn = await fetch('http://localhost:8000/auth/signIn', { 
                method: 'POST',
                mode: 'cors',
                headers: {
                    'Content-Type': 'application/json'
                },
                credentials: 'include',
                body: JSON.stringify(dataToPost) 
            })
            const ok = await userSignIn.json().then(res => res)
            await console.log(ok)
             if(ok.username == username) {
              console.log('ok')
              return navigate('/Dashboard')
            }
          
        } catch (error) {
          
        }
    }
  return (
    <WavePage
    >
    <FormComponent
    buttonText='Sign In'
    smallTextBottom='Forgot your password?'
    headerSubtitle='Please sign in below'
    formInputFields={['email', 'username', 'password']}
    header='Sign-In'
    linkPath='/ok'
    errorMessage={error}
    apiCallback={handleSignIn}
    key={2}
    />
    </WavePage>
  )
}
