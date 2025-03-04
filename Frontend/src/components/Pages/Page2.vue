<template>
  <div class="container">
    <div class="page" :style="{ display: 'block' }">
      <!-- Cím rész -->
      <h2>
        <span>A RENDEZVÉNY RÉSZLETES ADATAI</span>
        <i class="bi bi-info-circle" title="A * részek kötelezőek"></i>
      </h2>

      <!-- Rendezvény jellege -->
      <div class="form-row">
        <div class="form-group">
          <label for="eventNature">Rendezvény jellege *</label>
          <input
            type="text"
            id="eventNature"
            v-model="eventNature"
            placeholder="Például: konferencia, workshop, koncert, stb."
            class="form-control"
            required
          />
          <span v-if="errors.eventNature" class="error">{{ errors.eventNature }}</span>
        </div>

        <!-- Részletes programterv -->
        <div class="form-group">
          <label for="eventProgram">Részletes programterv *</label>
          <textarea
            id="eventProgram"
            v-model="eventProgram"
            placeholder="Adja meg a rendezvény részletes programtervét"
            class="form-control"
            required
          ></textarea>
          <span v-if="errors.eventProgram" class="error">{{ errors.eventProgram }}</span>
        </div>
      </div>

      <!-- Helyszín berendezési módja -->
      <div class="form-row">
        <div class="form-group">
          <label for="venueSetup">Helyszín berendezési módja</label>
          <textarea
            id="venueSetup"
            v-model="venueSetup"
            placeholder="Csatolva is megfelelő, amennyiben nem tudja megadni a berendezés módját, kollégáink felveszik Önnel a kapcsolatot."
            class="form-control"
          ></textarea>
        </div>
      </div>

      <!-- Igen/Nem választó mezők csoportosítva és csukható menükben -->
      <div class="accordion">
        <div
          class="accordion-item"
          v-for="(group, index) in groupedYesNoFields"
          :key="index"
        >
          <h3 class="accordion-header">
            <button
              class="accordion-button"
              :class="{ collapsed: activeAccordion !== index }"
              type="button"
              @click="toggleAccordion(index)"
              :aria-expanded="activeAccordion === index ? 'true' : 'false'"
              :aria-controls="'collapse' + index"
            >
              Csoport {{ index + 1 }}
            </button>
          </h3>
          <div
            :id="'collapse' + index"
            class="accordion-collapse collapse"
            :class="{ show: activeAccordion === index }"
            :aria-labelledby="'heading' + index"
          >
            <div class="accordion-body">
              <div class="form-row">
                <div
                  class="form-group"
                  v-for="field in group"
                  :key="field.id"
                >
                  <label>{{ field.label }} *</label>
                  <div class="radio-group">
                    <input
                      type="radio"
                      :id="field.id + '_igen'"
                      :name="field.id"
                      value="igen"
                      v-model="field.value"
                    />
                    <label :for="field.id + '_igen'">Igen</label>
                    <input
                      type="radio"
                      :id="field.id + '_nem'"
                      :name="field.id"
                      value="nem"
                      v-model="field.value"
                      class="ms-3"
                    />
                    <label :for="field.id + '_nem'">Nem</label>
                  </div>
                  <span v-if="errors[field.id]" class="error">{{ errors[field.id] }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Villanyszerelői ügyelet és Várható tevékenységek -->
      <div class="form-row">
        <div class="form-group">
          <label for="electricianDuty">Szükséges villanyszerelői ügyelet? *</label>
          <select id="electricianDuty" v-model="electricianDuty" class="form-control" required>
            <option value="" disabled>Válasszon egy opciót</option>
            <option value="rendezvény előtt">Rendezvény előtt</option>
            <option value="rendezvény közben">Rendezvény közben</option>
            <option value="rendezvény után">Rendezvény után</option>
            <option value="nem szükséges">Nem szükséges</option>
          </select>
          <span v-if="errors.electricianDuty" class="error">{{ errors.electricianDuty }}</span>
        </div>

        <div class="form-group">
          <label for="expectedActivities">Várható-e az alábbi tevékenységek közül valamelyik? *</label>
          <select
            id="expectedActivities"
            v-model="expectedActivity"
            class="form-control"
            required
          >
            <option value="" disabled>Válasszon egy opciót</option>
            <option v-for="activity in activities" :key="activity" :value="activity">
              {{ activity }}
            </option>
          </select>
          <span v-if="errors.expectedActivity" class="error">{{ errors.expectedActivity }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      eventNature: "",
      eventProgram: "",
      venueSetup: "",
      electricianDuty: "",
      expectedActivity: "", // Egyetlen választott tevékenység
      activities: ["por", "füst", "páraképződés", "egyik sem várható"], // Opciók
      yesNoFields: [
        { id: "accommodation", label: "Van a rendezvény idejére szállásigénye?", value: "" },
        { id: "parking", label: "Van parkolóhely igénye?", value: "" },
        { id: "waste", label: "Keletkezik hulladék?", value: "" },
        { id: "internet", label: "Szükséges internetkapcsolat (WiFi) a rendezvény idejére?", value: "" },
        { id: "technicalSupport", label: "Szükséges-e oktatástechnikai támogatás?", value: "" },
        { id: "disabledAccess", label: "Korlátozott mozgású személyek részt vesznek?", value: "" },
        { id: "photography", label: "Fotó és/vagy videófelvétel készül-e a rendezvényen?", value: "" },
        { id: "catering", label: "Lesz a rendezvény területén catering?", value: "" },
        { id: "construction", label: "Várhatóak a rendezvényen építési és bontási munkálatok?", value: "" },
        { id: "cleaningBefore", label: "Igényel takarítást a rendezvény előtt?", value: "" },
        { id: "cleaningDuring", label: "Igényel takarítási ügyeletet a rendezvény alatt?", value: "" },
        { id: "powerSupply", label: "Szükséges rendezvényszekrényből áram vételezése?", value: "" },
        { id: "fireHazard", label: "Tűzveszélyes tevékenység várható-e?", value: "" },
        { id: "chemicals", label: "Vegyi anyag felhasználása várható-e?", value: "" },
        { id: "decoration", label: "Várható-e dekoráció a helyiség légterében?", value: "" },
      ],
      activeAccordion: null, // Aktív accordion indexe
      errors: {},
    };
  },
  computed: {
    // Igen/Nem mezők csoportosítása 4-esével
    groupedYesNoFields() {
      const groupSize = 4;
      return this.yesNoFields.reduce((groups, field, index) => {
        const groupIndex = Math.floor(index / groupSize);
        if (!groups[groupIndex]) {
          groups[groupIndex] = [];
        }
        groups[groupIndex].push(field);
        return groups;
      }, []);
    },
  },
  methods: {
    toggleAccordion(index) {
      // Csak egy accordion lehet nyitva egyszerre
      this.activeAccordion = this.activeAccordion === index ? null : index;
    },
  },
};
</script>

<style src="/src/assets/css/style_pages.css"></style>