import { useState } from 'react';
import './global.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { Navbar } from './Components/Navbar';
import { LandingPage } from './Pages/main/LandingPage';
import reactLogo from './assets/react.svg';
import { SignUp } from './Pages/signup/SignUp';
import { Dashboard } from './Pages/dashboard/Dashboard';
import { SignIn } from './Pages/signin/SignIn';

function App() {
  const { pathname } = window.location;
  const isDashboard = pathname === '/Dashboard';

  return (
    <div className="App">
      <BrowserRouter>
        {!isDashboard && <Navbar />}
        <Routes>
          <Route
            path="/"
            element={<LandingPage />}
          />
          <Route
            path="/signUp"
            element={<SignUp />}
          />
          <Route
            path="/Dashboard"
            element={<Dashboard />}
          />
          <Route
            path="/signIn"
            element={<SignIn />}
          />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
