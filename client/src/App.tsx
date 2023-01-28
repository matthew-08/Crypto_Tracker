import { useState } from 'react'
import reactLogo from './assets/react.svg'
import './global.css'
import { Navbar } from './Components/Navbar'
import { LandingPage } from './Pages/main/LandingPage'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { SignUp } from './Pages/signup/SignUp'
import { Dashboard } from './Pages/dashboard/Dashboard'
import { SignTest } from './Pages/signup/SignTest'
import { SignIn } from './Pages/signin/SignIn'

function App() {

  const pathname = window.location.pathname
  const isDashboard = pathname === '/Dashboard'
  console.log(isDashboard)

  return (
    <div className="App">
      <BrowserRouter>
      {!isDashboard && <Navbar />}
        <Routes>
          <Route
            path='/'
            element={<LandingPage />}
          />
          <Route
            path='/signUp'
            element={<SignUp />}
          />
          <Route 
            path='/Dashboard'
            element = {<Dashboard/>}
          />
          <Route
            path='/signIn'
            element = {<SignIn/>}
          />
        </Routes>
      </BrowserRouter>
    </div>
  )
}

export default App
