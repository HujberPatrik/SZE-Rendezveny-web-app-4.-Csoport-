<template>
    <div class="container mt-4">
        <h2 class="mb-4">Rendezvény Részletek</h2>
        
        <div class="card">
            <div class="card-header">
                <h4 id="event-name">Rendezvény Neve</h4>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="start-time" class="form-label">Kezdő Időpont</label>
                    <input type="datetime-local" class="form-control" id="start-time">
                </div>
                <div class="mb-3">
                    <label for="end-time" class="form-label">Záró Időpont</label>
                    <input type="datetime-local" class="form-control" id="end-time">
                </div>
                <div class="mb-3">
                    <label for="location" class="form-label">Helyszín</label>
                    <input type="text" class="form-control" id="location">
                </div>
                <div class="mb-3">
                    <label for="event-type" class="form-label">Rendezvény Típusa</label>
                    <input type="text" class="form-control" id="event-type">
                </div>
                <div class="mb-3">
                    <label for="event-description" class="form-label">Leírás</label>
                    <textarea class="form-control" id="event-description" rows="3"></textarea>
                </div>
                
                <button class="btn btn-primary" id="save-btn">Mentés</button>
                <button class="btn btn-danger ms-3" id="delete-btn">Törlés</button>
            </div>
        </div>

        <div class="mt-4">
            <a href="/admin" class="btn btn-secondary">Vissza a főoldalra</a>
        </div>
    </div>
</template>
    