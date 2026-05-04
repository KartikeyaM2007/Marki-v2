<p align="center">
  <strong>✦ Marki</strong>
</p>

<h1 align="center">AI Marketing Copilot</h1>

<p align="center">
  An end-to-end Generative AI platform that helps marketers <strong>create, manage, analyze, and optimize</strong> social media content — powered by AI that learns your brand voice.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/React-19-blue?logo=react" alt="React" />
  <img src="https://img.shields.io/badge/Vite-8-646CFF?logo=vite" alt="Vite" />
  <img src="https://img.shields.io/badge/Express-5-000?logo=express" alt="Express" />
  <img src="https://img.shields.io/badge/Supabase-Auth%20%2B%20DB-3ECF8E?logo=supabase" alt="Supabase" />
  <img src="https://img.shields.io/badge/Groq-LLM%20API-FF6600" alt="Groq" />
</p>

---

## ✨ Features

| Feature | Description |
|---|---|
| **🏷️ Brand Profile** | Define your brand voice, tone, audience, and visual identity — used as context for every AI generation |
| **✍️ AI Studio** | Generate platform-specific posts for LinkedIn, X, and Instagram with one click |
| **📊 Analytics** | Track engagement, view top posts, heatmaps, and AI-powered performance insights |
| **💬 AI Chat (RAG)** | Context-aware marketing assistant powered by Retrieval-Augmented Generation |
| **📅 Scheduling** | Plan and queue posts across platforms with calendar preview |
| **🕓 History** | View, reuse, and manage all previously generated content |
| **⚙️ Settings** | Update profile, manage account, and configure preferences |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Frontend** | React 19, Vite 8, React Router 7, Recharts |
| **Backend** | Node.js, Express 5, Groq SDK |
| **Database** | Supabase (PostgreSQL + Auth + RLS) |
| **AI** | Groq API (LLaMA) with prompt engineering |
| **Styling** | Vanilla CSS with CSS variables (pure black & white monochrome theme) |
| **Font** | Inter (Google Fonts) |

---

## 📁 Folder Structure

```
Marki/
├── backend/                    # Express API server
│   ├── index.js                # Main server — routes, Groq prompt builder, AI endpoints
│   ├── .env                    # GROQ_API_KEY, PORT
│   └── package.json
│
├── frontend/                   # React + Vite client
│   ├── public/                 # Static assets (favicon, icons)
│   ├── src/
│   │   ├── assets/             # Images (hero.png, etc.)
│   │   ├── components/
│   │   │   └── NavigationBar.jsx   # Global navbar with auth-aware UI
│   │   ├── lib/
│   │   │   ├── supabase.js         # Supabase client initialization
│   │   │   └── SocialAuth.js       # OAuth identity linking (LinkedIn/Twitter)
│   │   ├── pages/
│   │   │   ├── Home.jsx            # Landing page with hero + features
│   │   │   ├── Signup.jsx          # User registration
│   │   │   ├── Login.jsx           # User login
│   │   │   ├── Dashboard.jsx       # Dashboard layout with sidebar
│   │   │   ├── Studios.jsx         # AI content generation studio
│   │   │   ├── BrandProfile.jsx    # Brand voice configuration form
│   │   │   ├── Analytics.jsx       # Charts, heatmaps, AI insights
│   │   │   ├── Chat.jsx            # RAG-based AI chat interface
│   │   │   ├── History.jsx         # Past generated posts
│   │   │   ├── Settings.jsx        # Account settings
│   │   │   └── About.jsx           # About page
│   │   ├── styles/                 # Page-specific CSS modules
│   │   │   ├── HomeCSS.css
│   │   │   ├── AuthCSS.css
│   │   │   ├── DashboardCSS.css
│   │   │   ├── StudiosCSS.css
│   │   │   ├── BrandProfileCSS.css
│   │   │   ├── AnalyticsCSS.css
│   │   │   ├── ChatCSS.css
│   │   │   ├── HistoryCSS.css
│   │   │   ├── SettingsCSS.css
│   │   │   ├── AboutCSS.css
│   │   │   └── NavigationBarCSS.css
│   │   ├── App.jsx             # Root component with React Router
│   │   ├── App.css
│   │   ├── index.css           # Global base styles
│   │   └── main.jsx            # Vite entry point
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
├── schema.sql                  # Supabase database schema (profiles, brands, posts + RLS)
└── README.md
```

---

## 🔄 How It Works

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   User        │     │   Frontend   │     │   Backend    │
│   (Browser)   │────▶│   React App  │────▶│   Express    │
└──────────────┘     └──────┬───────┘     └──────┬───────┘
                            │                     │
                            ▼                     ▼
                     ┌──────────────┐     ┌──────────────┐
                     │   Supabase   │     │   Groq API   │
                     │   Auth + DB  │     │   (LLaMA)    │
                     └──────────────┘     └──────────────┘
```

### Workflow

1. **Sign Up / Log In** → Supabase Auth creates a session and auto-generates a `profiles` row
2. **Set Up Brand Profile** → Store your brand voice, tone, audience, and docs in Supabase `brands` table
3. **Open AI Studio** → Choose a platform (LinkedIn / X / Instagram), write a prompt, hit Generate
4. **Backend builds a prompt** → Combines your brand context + platform instructions + user prompt
5. **Groq API returns content** → Multiple variations generated in real-time
6. **Edit, rewrite, or schedule** → Use AI actions (shorten, expand, add emojis, rewrite tone)
7. **Save to History** → Posts are stored in Supabase `posts` table
8. **Track in Analytics** → View engagement metrics, heatmaps, and AI-powered insights

---

## ⚡ Quick Start

### Prerequisites

- **Node.js** 18+  
- **npm** 9+  
- A **Supabase** project (free tier works)  
- A **Groq** API key ([console.groq.com](https://console.groq.com))

### 1. Clone the repo

```bash
git clone https://github.com/KartikeyaM2007/Marki.git
cd Marki
```

### 2. Set up the database

Copy the contents of `schema.sql` and run it in your **Supabase SQL Editor**. This creates:
- `profiles` table (auto-created on signup via trigger)
- `brands` table (stores brand voice data)
- `posts` table (stores generated content)
- Row Level Security policies for all tables

### 3. Configure environment variables

**Backend** — create `backend/.env`:
```env
GROQ_API_KEY=your_groq_api_key_here
PORT=5000
```

**Frontend** — create `frontend/.env`:
```env
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your_anon_key_here
VITE_BACKEND_URL=http://localhost:5000
```

### 4. Install dependencies

```bash
# Backend
cd backend
npm install

# Frontend
cd ../frontend
npm install
```

### 5. Run locally

```bash
# Terminal 1 — Backend
cd backend
npm run devStart

# Terminal 2 — Frontend
cd frontend
npm run dev
```

The frontend runs on `http://localhost:5173` and the backend on `http://localhost:5000`.

---

## 🧠 AI Architecture

### Prompt Engineering Pipeline

```
User Prompt
     │
     ▼
┌─────────────────────────────────────────┐
│            Prompt Builder               │
│                                         │
│  ┌─────────────┐  ┌──────────────────┐  │
│  │ Brand Voice  │  │ Platform Rules   │  │
│  │ (from DB)    │  │ (LinkedIn/X/IG)  │  │
│  └──────┬──────┘  └───────┬──────────┘  │
│         └────────┬────────┘             │
│                  ▼                      │
│         Combined System Prompt          │
└─────────────────┬───────────────────────┘
                  │
                  ▼
           ┌──────────┐
           │ Groq API │  ──▶  Generated Content
           │ (LLaMA)  │       (3 variations)
           └──────────┘
```

The system prompt includes:
- **Brand Context** — company name, industry, audience, tone, voice traits
- **Platform Instructions** — character limits, formatting rules, engagement patterns
- **User Controls** — goal, tone override, emoji/hashtag preferences

---

## 📄 API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/generate` | Generate AI content with brand context |
| `POST` | `/api/rewrite` | Rewrite existing content with AI action |
| `GET` | `/` | Health check |

---

## 🎨 Design System

The UI uses a **pure black & white monochrome** aesthetic:

| Token | Value |
|---|---|
| Background | `#000000` |
| Surface | `#0A0A0A` |
| Surface 2 | `#111111` |
| Text | `#FFFFFF` |
| Text Muted | `rgba(255,255,255,0.45)` |
| Border | `rgba(255,255,255,0.08)` |
| Font | Inter (400–900) |

All interactive elements use `cubic-bezier(0.16, 1, 0.3, 1)` easing for premium-feeling transitions.

---

## 🎯 Use Cases

- Social media managers automating content creation
- Startup founders building brand presence
- Marketing teams maintaining consistent brand voice
- Content creators scaling output across platforms

---

## 🚀 Future Roadmap

- [ ] AI-powered campaign builder
- [ ] Competitor analysis
- [ ] Engagement prediction
- [ ] Visual content generation (images, carousels)
- [ ] A/B testing for posts
- [ ] Multi-user collaboration
- [ ] Direct publishing to social platforms

---

## 📝 License

This project is for educational and portfolio purposes.

---

<p align="center">
  Built with ♠ by <strong>Kartikeya</strong>
</p>
