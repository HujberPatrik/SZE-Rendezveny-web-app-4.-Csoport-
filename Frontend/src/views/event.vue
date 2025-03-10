<template>
    <div>
      <h1>Rendezvény Adatok Szerkesztése</h1>
      <form @submit.prevent="saveData">
        <!-- Rendezvény alapadatok -->
         <div>A RENDEZVÉNY ADATAI:        </div>
        <div>
          <label for="eventName">Rendezvény neve </label>
          <input type="text" id="eventName" v-model="eventData.eventName" required>
        </div>
  
        <div>
          <label for="eventDescription">Rendezvény leírása </label>
          <textarea id="eventDescription" v-model="eventData.eventDescription" required></textarea>
        </div>
  
        <div>
          <label for="eventLocation">Rendezvény helyszíne </label>
          <input type="text" id="eventLocation" v-model="eventData.eventLocation" required>
        </div>
  
        <div>
          <label for="eventAddress">Rendezvény pontos címe </label>
          <input type="text" id="eventAddress" v-model="eventData.eventAddress" required>
        </div>
  
        <div>
          <label for="startDate">Rendezvény kezdő dátuma </label>
          <input type="date" id="startDate" v-model="eventData.startDate" required>
        </div>
  
        <div>
          <label for="startTime">Rendezvény kezdő időpontja </label>
          <input type="time" id="startTime" v-model="eventData.startTime" required>
        </div>
  
        <div>
          <label for="endDate">Rendezvény záró dátuma </label>
          <input type="date" id="endDate" v-model="eventData.endDate" required>
        </div>
  
        <div>
          <label for="endTime">Rendezvény záró időpontja </label>
          <input type="time" id="endTime" v-model="eventData.endTime" required>
        </div>
  
        <!-- Rendezvény típusa -->
        <div>
          <label for="eventType">Rendezvény típusa </label>
          <select id="eventType" v-model="eventData.eventType" required>
            <option value="Egyetemi szervezésű rendezvények">Egyetemi szervezésű rendezvények</option>
            <option value="Hallgatói rendezvények">Hallgatói rendezvények</option>
            <option value="Külső szervezésű rendezvények">Külső szervezésű rendezvények</option>
            <option value="Sportrendezvények">Sportrendezvények</option>
          </select>
        </div>
  
        <!-- Rendezvény minősítése -->
        <div>
          <label for="eventClassification">Rendezvény minősítése </label>
          <select id="eventClassification" v-model="eventData.eventClassification" required>
            <option value="Nyilvános">Nyilvános</option>
            <option value="Zártkörű">Zártkörű</option>
          </select>
        </div>
  
        <div>
          <button type="submit">Mentés</button>
        </div>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        eventData: {
          eventName: "Konferencia 2023",
          eventDescription: "Éves tudományos konferencia",
          eventLocation: "Egyetemi terem",
          eventAddress: "9026 Győr, Egyetem tér 1.",
          startDate: "2023-11-15",
          startTime: "09:00",
          endDate: "2023-11-16",
          endTime: "18:00",
          eventType: "Egyetemi szervezésű rendezvények",
          eventClassification: "Nyilvános",
        },
      };
    },
    methods: {
      saveData() {
        console.log("Mentett adatok:", this.eventData);
        alert("Adatok mentve!");
      },
    },
  };
  </script>
  