<template>
  <div id="app">
    <Navbar /> <!-- Navbar komponens -->

    <!-- Dinamikus komponens váltás -->
    <component :is="currentPage" />

    <!-- Navigáció és kitöltési csík -->
    <div class="navigation-container">
      <!-- Balra gomb -->
      <button @click="navigate(activePage - 1)" :disabled="activePage === 1" class="nav-button">
        <i class="bi bi-arrow-left"></i> <!-- Balra nyíl ikon -->
      </button>

      <!-- Kitöltési csík -->
      <div class="progress-container">
        <progress :value="progress" max="100"></progress>
        <span>{{ progress }}%</span>
      </div>

      <!-- Jobbra gomb -->
      <button @click="navigate(activePage + 1)" :disabled="activePage === totalPages" class="nav-button">
        <i class="bi bi-arrow-right"></i> <!-- Jobbra nyíl ikon -->
      </button>
    </div>

    <!-- Gombok az oldal alján -->
    <div class="button-container">
      <button @click="changePage('Pages')">Pages</button>
      <button @click="changePage('Pages2')">Pages2</button>
      <button @click="changePage('Pages3')">Pages3</button>
      <button @click="changePage('Pages4')">Pages4</button>
      <button @click="changePage('Pages5')">Pages5</button>
    </div>
  </div>
</template>

<script>
import Navbar from '../components/Navbar.vue';
import Pages from '../components/Pages/Page.vue';
import Pages2 from '../components/Pages/Page2.vue';
import Pages3 from '../components/Pages/Page3.vue';
import Pages4 from '../components/Pages/Page4.vue';
import Pages5 from '../components/Pages/Page5.vue';

export default {
  components: {
    Navbar,
    Pages,
    Pages2,
    Pages3,
    Pages4,
    Pages5,
  },
  data() {
    return {
      currentPage: 'Pages', // Alapértelmezett komponens
      activePage: 1, // Aktuális oldal sorszáma
      totalPages: 5, // Összes oldal száma
    };
  },
  computed: {
    // Kitöltési százalék számítása
    progress() {
      return ((this.activePage - 1) / (this.totalPages - 1)) * 100;
    },
  },
  methods: {
    // Oldal váltása
    changePage(page) {
      this.currentPage = page;
      this.activePage = this.getPageIndex(page) + 1;
    },
    // Navigáció
    navigate(page) {
      if (page >= 1 && page <= this.totalPages) {
        this.activePage = page;
        this.currentPage = this.getPageName(page);
      }
    },
    // Oldal nevének lekérése az index alapján
    getPageName(index) {
      const pages = ['Pages', 'Pages2', 'Pages3', 'Pages4', 'Pages5'];
      return pages[index - 1];
    },
    // Oldal indexének lekérése a név alapján
    getPageIndex(page) {
      const pages = ['Pages', 'Pages2', 'Pages3', 'Pages4', 'Pages5'];
      return pages.indexOf(page);
    },
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body,
html {
  height: 100%;
  font-family: Arial, sans-serif;
  background-color: #f1f3f5;
}

/* Navigációs konténer */
.navigation-container {
  position: fixed;
  bottom: 60px; /* A gombok felett */
  left: 0;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
  background-color: #242943;
  padding: 10px;
}

/* Navigációs gombok */
.nav-button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.nav-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

/* Kitöltési csík */
.progress-container {
  display: flex;
  align-items: center;
  gap: 10px;
}

progress {
  width: 200px;
  height: 10px;
  border-radius: 5px;
}

progress::-webkit-progress-bar {
  background-color: #ddd;
  border-radius: 5px;
}

progress::-webkit-progress-value {
  background-color: #4CAF50;
  border-radius: 5px;
}

/* Gombok az oldal alján */
.button-container {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: #242943;
  padding: 10px;
  text-align: center;
}

.button-container button {
  margin: 0 10px;
  padding: 10px 20px;
  font-size: 1rem;
  color: white;
  background-color: #4CAF50;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.button-container button:hover {
  background-color: #45a049;
}
</style>