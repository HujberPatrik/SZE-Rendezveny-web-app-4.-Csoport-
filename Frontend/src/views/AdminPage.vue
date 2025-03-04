<template>
    <div class="container-fluid position-relative bg-white d-flex p-0">



        
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3" style="background-color: #242943; height: 100vh; position: fixed; top: 0; left: 0; width: 250px;">
            <nav class="navbar navbar-light" style="background-color: #242943;">
                <!-- Logó elrejtése kis képernyőkön -->
                <a href="index.html" class="navbar-brand d-none d-md-flex align-items-center mx-4 mb-3">
                    <img src="img/egyetemi logo/fekvo_RGB/sze_logo_fekvo_RGB_negativ.png" alt="SZE Logó" height="60px">
                </a>
                
                <!-- Placeholder for logo when hidden on smaller screens (larger gap) -->
                <div class="d-flex d-md-none" style="height: 95px; margin-top: 15px;"></div>
                
                <div class="d-flex align-items-center ms-4 mb-4">
                </div>
                
                <!-- Gombok görgethető konténerben -->
                <div class="navbar-nav w-100" style="flex-wrap: nowrap; overflow-x: auto; white-space: nowrap; position: relative;">
                    <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Főoldal</a>
                    <a href="bejelentes.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Teszt Bejelentes</a>
                    <a href="signin.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Teszt login</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Egyéb</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="" class="dropdown-item"  style="color: #50adc9;">oldal</a>
                            <a href="" class="dropdown-item"  style="color: #50adc9;">oldal</a>
                            <a href="" class="dropdown-item"  style="color: #50adc9;">oldal</a>

                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">


<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top px-4 py-0">
    <a href="index.html" class="navbar-brand d-flex me-4 d-none d-md-flex">
        <img src="../img/egyetemi logo/allo_RGB/sze_logo_allo_RGB_white_bg.png" 
             alt="SZE Logó" class="img-fluid" style="max-height: 50px;">
    </a>

    <div class="d-flex align-items-center flex-nowrap flex-grow-1">
        <a href="#" class="sidebar-toggler flex-shrink-0 me-3">
            <i class="fa fa-bars"></i>
        </a>

        <form class="d-flex flex-grow-1" style="max-width: 200px;">
            <input class="form-control border-0" type="search" placeholder="Keresés">
            <button class="btn button_navbar ms-2 rounded-circle" id="buttons_navbar" type="submit">
                <i class="fa fa-search" style="color: #242943;"></i>
            </button>
        </form>
    </div>

    <div class="navbar-nav align-items-center ms-auto">
        <div class="nav-item d-none d-lg-flex">
            <button class="btn button_navbar ms-2 rounded-circle" id="dark-mode-toggle">
                <i id="mode-icon" class="fa fa-moon" style="color: #242943;"></i>
            </button>
        </div>

        <div class="nav-item dropdown d-none d-lg-flex">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <i class="fa fa-bell me-lg-2" style="color: #242943;"></i>
                <span class="d-none d-lg-inline-flex">Értesítések</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <a href="#" class="dropdown-item">
                    <h6 class="fw-normal mb-0">Teszt</h6>
                    <small>Teszt</small>
                </a>
            </div>
        </div>

        <div class="nav-item dropdown position-relative">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <img class="rounded-circle me-lg-2" src="../img/user.jpg" alt="" style="width: 40px; height: 40px;">
                <span class="d-none d-lg-inline-flex" style="color: #50adc9;">Teszt Pista</span> 
                <span class="d-none d-lg-inline-flex ms-1 text-muted" style="font-size: 0.8rem;">(Admin)</span> <!-- Státusz -->
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0 position-absolute profile-dropdown">
                <a href="#" class="dropdown-item d-block d-lg-none" id="notifications-text" style="color: #50adc9;" >
                    Teszt Pista (Admin)
                </a>

                <a href="#" class="dropdown-item d-block d-lg-none" id="dark-mode-text" >
                    <i class="fa fa-moon me-2"></i> Sötét mód
                </a>
                <a href="#" class="dropdown-item d-block d-lg-none" id="notifications-text">
                    <i class="fa fa-bell me-2"></i> Értesítések
                </a>

                <a href="#" class="dropdown-item">
                    <i class="fa fa-user me-2"></i> Saját profil
                </a>
                <a href="#" class="dropdown-item">
                    <i class="fa fa-cogs me-2"></i> Beállítások
                </a>

                <a href="#" class="dropdown-item text-danger">
                    <i class="fa fa-sign-out-alt me-2"></i> Kijelentkezés
                </a>
            </div>
        </div>



    </div>
</nav>
<!-- Navbar End -->


<Graphs></Graphs>
<Table></Table>






    </div>
</div>

</template>

<script>
// Importálás
import Graphs from '../components/Graphs.vue'; // Az útvonal a komponenshez
import Table from '../components/Table.vue'; // Az útvonal a komponenshez

export default {
  components: {
    Graphs,
    Table
  }
};
</script>