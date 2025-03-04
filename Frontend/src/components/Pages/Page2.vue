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
      </div>

      <!-- Részletes programterv és Helyszín berendezési módja -->
      <div class="form-row program-and-layout">
        <!-- Részletes programterv -->
        <div class="form-group detailed-program">
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

        <!-- Helyszín berendezési módja -->
        <div class="form-group layout-arrangement">
          <label for="venueSetup">Helyszín berendezési módja</label>
          <textarea
            id="venueSetup"
            v-model="venueSetup"
            placeholder="Csatolva is megfelelő, amennyiben nem tudja megadni a berendezés módját, kollégáink felveszik Önnel a kapcsolatot."
            class="form-control"
          ></textarea>
        </div>
      </div>

      <!-- Igen/Nem választó mezők csoportosítva és egymás mellett -->
      <div class="accordion-group">
        <!-- Csoportok fejlécei -->
        <div class="accordion-headers">
          <div
            class="accordion-header"
            v-for="(group, index) in groupedYesNoFields"
            :key="index"
            @click="toggleAccordion(index)"
            :class="{ active: activeAccordion === index }"
          >
            Kérdőív {{ index + 1 }}
          </div>
        </div>

        <!-- Közös tartalomterület -->
        <div class="accordion-content">
          <div
            class="accordion-body"
            v-if="activeAccordion !== null"
          >
            <div class="form-row grouped-fields">
              <div
                class="form-group"
                v-for="field in groupedYesNoFields[activeAccordion]"
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
                <!-- Szállásigény létszám mezője, ha az "Igen" opció van kiválasztva -->
                <div v-if="field.id === 'accommodation' && field.value === 'igen'" class="form-group">
                  <label for="accommodationCount">Szállásigény várható létszáma *</label>
                  <input
                    type="number"
                    id="accommodationCount"
                    v-model="accommodationCount"
                    placeholder="Adja meg a létszámot"
                    class="form-control"
                    required
                  />
                  <span v-if="errors.accommodationCount" class="error">{{ errors.accommodationCount }}</span>
                </div>
                <!-- Parkolóhely igény részletei, ha az "Igen" opció van kiválasztva -->
                <div v-if="field.id === 'parking' && field.value === 'igen'" class="form-group">
                  <label for="parkingDetails">Várható gépkocsiforgalom és parkolóhely igény *</label>
                  <textarea
                    id="parkingDetails"
                    v-model="parkingDetails"
                    placeholder="Adja meg a várható gépkocsiforgalom és parkolóhely igény részleteit"
                    class="form-control"
                    required
                  ></textarea>
                  <span v-if="errors.parkingDetails" class="error">{{ errors.parkingDetails }}</span>
                </div>
                <!-- Hulladék elszállításának módja, ha az "Igen" opció van kiválasztva -->
                <div v-if="field.id === 'waste' && field.value === 'igen'" class="form-group">
                  <label for="wasteDisposalMethod">Hulladék elszállításának módja *</label>
                  <select
                    id="wasteDisposalMethod"
                    v-model="wasteDisposalMethod"
                    class="form-control"
                    required
                  >
                    <option value="" disabled>Válasszon egy opciót</option>
                    <option value="sajat">Saját úton</option>
                    <option value="egyetem">Egyetem által biztosítva</option>
                  </select>
                  <span v-if="errors.wasteDisposalMethod" class="error">{{ errors.wasteDisposalMethod }}</span>
                  <!-- Ha a "Saját úton" opció van kiválasztva -->
                  <div v-if="wasteDisposalMethod === 'sajat'" class="form-group">
                    <label for="wasteDisposalResponsible">Ki végzi a hulladék elszállítását? *</label>
                    <input
                      type="text"
                      id="wasteDisposalResponsible"
                      v-model="wasteDisposalResponsible"
                      placeholder="Adja meg a felelős személyt vagy céget"
                      class="form-control"
                      required
                    />
                    <span v-if="errors.wasteDisposalResponsible" class="error">{{ errors.wasteDisposalResponsible }}</span>
                  </div>
                </div>
                <!-- Oktatástechnikai eszközigény, ha az "Igen" opció van kiválasztva -->
                <div v-if="field.id === 'technicalSupport' && field.value === 'igen'" class="form-group">
                  <label for="technicalEquipmentNeeds">Oktatástechnikai eszközigény *</label>
                  <textarea
                    id="technicalEquipmentNeeds"
                    v-model="technicalEquipmentNeeds"
                    placeholder="Adja meg az oktatástechnikai eszközigény részleteit"
                    class="form-control"
                    required
                  ></textarea>
                  <span v-if="errors.technicalEquipmentNeeds" class="error">{{ errors.technicalEquipmentNeeds }}</span>
                </div>
                <span v-if="errors[field.id]" class="error">{{ errors[field.id] }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Villanyszerelői ügyelet és Várható tevékenységek egymás mellett -->
      <div class="form-row electrician-and-activities">
        <div class="form-group electrician-duty">
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

        <div class="form-group expected-activities">
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
      expectedActivity: "",
      activities: ["por", "füst", "páraképződés", "egyik sem várható"],
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
      accommodationCount: "", // Szállásigény létszáma
      parkingDetails: "", // Parkolóhely részletei
      wasteDisposalMethod: "", // Hulladék elszállításának módja
      wasteDisposalResponsible: "", // Ki végzi a hulladék elszállítását
      technicalEquipmentNeeds: "", // Oktatástechnikai eszközigény
      activeAccordion: 0,
      errors: {},
    };
  },
  computed: {
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
      this.activeAccordion = this.activeAccordion === index ? null : index;
    },
    validateForm() {
      this.errors = {};

      // Szállásigény validáció
      const accommodationField = this.yesNoFields.find(field => field.id === "accommodation");
      if (accommodationField && accommodationField.value === "igen" && !this.accommodationCount) {
        this.errors.accommodationCount = "Kötelező megadni a szállásigény várható létszámát.";
      }

      // Parkolóhely validáció
      const parkingField = this.yesNoFields.find(field => field.id === "parking");
      if (parkingField && parkingField.value === "igen" && !this.parkingDetails) {
        this.errors.parkingDetails = "Kötelező megadni a várható gépkocsiforgalom és parkolóhely igény részleteit.";
      }

      // Hulladék validáció
      const wasteField = this.yesNoFields.find(field => field.id === "waste");
      if (wasteField && wasteField.value === "igen") {
        if (!this.wasteDisposalMethod) {
          this.errors.wasteDisposalMethod = "Kötelező megadni a hulladék elszállításának módját.";
        }
        if (this.wasteDisposalMethod === "sajat" && !this.wasteDisposalResponsible) {
          this.errors.wasteDisposalResponsible = "Kötelező megadni, ki végzi a hulladék elszállítását.";
        }
      }

      // Oktatástechnikai támogatás validáció
      const technicalSupportField = this.yesNoFields.find(field => field.id === "technicalSupport");
      if (technicalSupportField && technicalSupportField.value === "igen" && !this.technicalEquipmentNeeds) {
        this.errors.technicalEquipmentNeeds = "Kötelező megadni az oktatástechnikai eszközigényt.";
      }

      // További validációk...

      return Object.keys(this.errors).length === 0;
    },
  },
};
</script>

<style src="/src/assets/css/style_pages.css"></style>