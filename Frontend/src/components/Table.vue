<template>
    
<div class="container-fluid pt-4 px-4 table-container">
    <div class="bg-light text-center rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Rendezvények</h6>
            <a href="">Összes</a>
        </div>
        
        <div class="table-wrapper">
            <div class="table-filters mb-3 d-flex flex-wrap gap-2">
                <input type="text" id="filter-name" class="form-control form-control-sm flex-grow-1" placeholder="Neve keresése">
                <div class="d-flex flex-grow-1 gap-2">
                    <input type="date" id="filter-start-time" class="form-control form-control-sm">
                </div>
                                <select id="filter-location" class="form-control form-control-sm flex-grow-1">
                    <option value="">Helyszín szűrése</option>
                    <option value="Helyszín 1">Helyszín 1</option>
                    <option value="Helyszín 2">Helyszín 2</option>
                    <option value="Helyszín 3">Helyszín 3</option>
                    <option value="Helyszín 4">Helyszín 4</option>
                    <option value="Helyszín 5">Helyszín 5</option>
                </select>
                <select id="filter-type" class="form-control form-control-sm flex-grow-1">
                    <option value="">Típus szűrése</option>
                    <option value="Konferencia">Konferencia</option>
                    <option value="Workshop">Workshop</option>
                    <option value="Előadás">Előadás</option>
                    <option value="Kiállítás">Kiállítás</option>
                    <option value="Szimpózium">Szimpózium</option>
                </select>
            </div>

            <!-- Táblázat -->
            <div class="table-scrollable">
                <table class="table text-start align-middle table-bordered table-hover mb-0">
                    <thead>
                        <tr class="text-dark">
                            <th scope="col">Neve</th>
                            <th scope="col">Kezdő Időpont</th>
                            <th scope="col">Záró Időpont</th>
                            <th scope="col">Helyszín</th>
                            <th scope="col">Rendezvény Típusa</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                        <tr>
                            <td>Rendezvény 1</td>
                            <td>2025-03-01 10:00</td>
                            <td>2025-03-01 18:00</td>
                            <td>Helyszín 1</td>
                            <td>Konferencia</td>
                            <td>
                            <a href="/event">
                                <button id="settingsButton">
                                    <i class="fas fa-cog"></i>
                                </button>
                            </a>
                            </td>

                        </tr>
                        <tr>
                            <td>Rendezvény 2</td>
                            <td>2025-03-02 09:00</td>
                            <td>2025-03-02 17:00</td>
                            <td>Helyszín 2</td>
                            <td>Workshop</td>
                            <td>
                            <a href="/event">
                                <button id="settingsButton">
                                    <i class="fas fa-cog"></i>
                                </button>
                            </a>
                            </td>

                        </tr>
                </table>
            </div>
        </div>
    </div>
</div>

</template>