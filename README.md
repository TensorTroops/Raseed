# Project Raseed

**AI-powered multimodal assistant for receipt management, wallet integration, and sustainable spending. Built with Flutter, Python, and Vertex AI Agents on Google Cloud.**

---

## Features

### 1. Multimodal Receipt Parsing (`Ingestion Agent`)
- Upload receipts as **image, document, video, or audio**
- Uses **Document AI**, **Gemini 2.5**, and **Speech-to-Text**
- Extracted data is structured as **JSON** and stored in **Firestore**

### 2. Entity Classification & Knowledge Graph (`Graph Builder Agent`)
- Auto-classifies products with **Gemini 2.5 Pro**
- Constructs entity-relation graphs stored in Firestore

### 3. Smart Reminders (`WarranTrack Agent`)
- Flags warranty and expiration items
- Schedules **Google Calendar** reminders for returns, insurance, expiry

### 4. Google Wallet Integration (`Pass Generator Agent`)
- Generates **Wallet Passes**: summaries, shopping lists, reminders
- Pushes updates via the **Google Wallet API**

### 5. Sustainable Spending (`EcoSpend & SmartShelf Agents`)
- Detects recurring purchases
- Suggests eco-friendly, cost-saving alternatives
- Predicts product shelf life and performs Firestore cleanup

---

##  Additional Capabilities

- Multilingual & voice-based querying
- **Google Calendar** integration for automated reminders
- Spending graph visualizations and insights
- Suggests nearby recycling/pre-owned stores via **Places API**
- Modular design with **Vertex AI Agents** for scalable orchestration

---

##  Tech Stack

| Layer      | Technology                                                           |
| ---------- | ---------------------------------------------------------------------|
| Frontend   | **Flutter**                                                          |
| Backend    | **Python** (`FastAPI`/`Flask`)                                       |
| AI/Cloud   | **Vertex AI**, **Gemini 2.5**, **Document AI**, **Firestore**        |
| API        | **Wallet API**, **Calendar API**, **Google Places API**              |

## Tech Stack 
<img width="1242" height="701" alt="Screenshot 2025-07-27 120716" src="https://github.com/user-attachments/assets/cefda98a-dcba-4e27-b1f5-45e0fba3f114" />

---

---

##  Contributors

<table>
  <tr>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/SajeevSenthil?s=300" width="100" alt="Sajeev Senthil" /><br/>
      <a href="https://github.com/SajeevSenthil"><b>Sajeev Senthil</b></a>
    </td>
        <td align="center">
      <img src="https://avatars.githubusercontent.com/Charuvarthan?s=300" width="100" alt="Charuvarthan" /><br/>
      <a href="https://github.com/Charuvarthan-T"><b>Charuvarthan</b></a>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/suganth07?s=300" width="100" alt="Suganth" /><br/>
      <a href="https://github.com/suganth07"><b>Suganth</b></a>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/abiruth29?s=300" width="100" alt="Abiruth" /><br/>
      <a href="https://github.com/abiruth29"><b>Abiruth</b></a>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/SivaPrasanthSivaraj?s=300" width="100" alt="Siva Prasanth Sivaraj" /><br/>
      <a href="https://github.com/SivaPrasanthSivaraj"><b>Siva Prasanth Sivaraj</b></a>
    </td>
  </tr>
</table>


🏆 Recognition
Winner of the “Breakthrough Concept" Award
Presented at the Google Agentic AI Day Hackathon for outstanding innovation in agentic AI applications.
- 🌍 57,000+ developers signed up globally
- 💡 9,100+ ideas submitted
- ✅ Top 700 teams shortlisted — including 650+ professional teams and 50+ student teams
- 🎯 For our problem statement, we were the only student team to reach the Top 15 finalists
- 🥇 Honored with the Concept Award for pushing boundaries in multimodal AI and sustainable tech
