<template>
    <nav class="navbar navbar-expand-lg navbar-light sticky-top px-4 py-3 bg-light">
      <!-- Logo with link -->
      <a href="index.html" class="navbar-brand d-flex" aria-label="Home">
        <img
          src="../img/egyetemi logo/fekvo_RGB/sze_logo_fekvo_RGB_white_bg.png"
          alt="SZE Logó"
          class="img-fluid"
          style="max-height: 50px"
        />
      </a>
      
      <!-- Navbar Text -->
      <div class="navbar-text ms-3" style="font-size: 1.2rem; font-weight: 500;">
        Rendezvénybejelentő űrlap - Széchenyi István Egyetem
      </div>
  
      <!-- Hamburger Menu for Small Screens -->
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
  
      <!-- Navbar Right Actions -->
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="ms-auto d-flex align-items-center gap-2">
          <!-- Back Button -->
          <a
            href="https://uni.sze.hu/"
            class="btn rounded-circle"
            style="background-color: #50adc9; padding: 12px; width: 42px; height: 42px; display: inline-flex; align-items: center; justify-content: center; border: none;"
            aria-label="Back to University Home"
          >
            <i class="fa fa-arrow-left" style="color: #ffffff;"></i>
          </a>
  
          <!-- Dark Mode Toggle -->
          <button
            class="btn rounded-circle"
            @click="toggleDarkMode"
            style="background-color: #50adc9; padding: 12px; width: 42px; height: 42px; display: inline-flex; align-items: center; justify-content: center; border: none;"
            aria-label="Toggle Dark Mode"
          >
            <i
              :class="darkMode ? 'fa fa-sun' : 'fa fa-moon'"
              style="color: #ffffff"
            ></i>
          </button>
  
          <!-- Profile Button -->
          <a
            href="/Login"
            class="btn rounded-circle"
            style="background-color: #50adc9; padding: 12px; width: 42px; height: 42px; display: inline-flex; align-items: center; justify-content: center; border: none;"
            aria-label="Go to Admin"
          >
            <i class="fa fa-user" style="color: #ffffff;"></i>
          </a>
        </div>
      </div>
    </nav>
  </template>
  
  <script>
  export default {
    data() {
      return {
        darkMode: false,
      };
    },
    methods: {
      toggleDarkMode() {
        this.darkMode = !this.darkMode;
        document.body.classList.toggle('dark-mode', this.darkMode);
      },
    },
  };
  </script>
  
  <style scoped>
  /* Navbar styles */
  .navbar {
    background-color: #f8f9fa;
    border-bottom: 1px solid #ddd;
  }
  
  .navbar-text {
    font-size: 1.2rem;
    font-weight: 500;
  }
  
  .navbar .btn {
    transition: background-color 0.3s ease;
  }
  
  .navbar .btn:hover {
    background-color: #4099b3;
  }
  
  .navbar .navbar-brand img {
    max-height: 50px;
  }
  
  @media (max-width: 768px) {
    .navbar-text {
      font-size: 0.9rem; /* Kisebb betűméret */
      margin-top: 10px;
    }
  
    .ms-auto {
      flex-direction: column;
      gap: 10px;
    }
  
    .ms-auto .btn {
      width: 40px;
      height: 40px;
    }
  
    /* Hamburger menu button size adjustments */
    .navbar-toggler {
      border: none;
    }
  
    .navbar-toggler-icon {
      background-color: #50adc9;
    }
  }
  
  body.dark-mode {
    background-color: #333;
    color: #fff;
  }
  
  body.dark-mode .navbar {
    background-color: #242943;
  }
  
  body.dark-mode .navbar .btn {
    background-color: #333;
  }
  
  body.dark-mode .navbar .btn:hover {
    background-color: #444;
  }
  </style>
  