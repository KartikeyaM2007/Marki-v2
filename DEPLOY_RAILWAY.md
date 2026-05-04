# Deploying Marki to Railway

Marki is a full-stack monorepo application. You can easily deploy both the frontend and backend services to Railway using the options below.

---

## Option 1: Deploy Both as One Monorepo Service (Easiest)

1. Go to your **Railway Dashboard**.
2. Click **New Project** → **GitHub** → select your repository.
3. Railway will use the root `package.json` to install dependencies for both the frontend and backend.
4. Set the following environment variables in your Railway project:
   - `GROQ_API_KEY`: `your-groq-key`
   - `VITE_SUPABASE_URL`: `https://your-project.supabase.co`
   - `VITE_SUPABASE_ANON_KEY`: `your-anon-key`
   - `VITE_BACKEND_URL`: Leave blank or point to the generated backend URL (if you want the backend to be separate).

---

## Option 2: Deploy as Two Separate Services (Recommended)

To keep both environments independent and scalable, deploy separate services from the same repository.

### 1. The Backend Service

1. Create a **New Service** from your GitHub repo.
2. Under the service **Settings**, set the **Root Directory** to `/backend` (or leave as `/` and set the Start Command to `node backend/index.js`).
3. Set the following **Environment Variables** for the backend service:
   - `GROQ_API_KEY`: `your-groq-key`
   - `PORT`: `5000` (or Railway will assign one automatically)
4. Expose the service by going to **Settings** → **Generate Domain**.

### 2. The Frontend Service

1. Create another **New Service** from the same GitHub repo.
2. Set the **Root Directory** to `/frontend`.
3. Set the following **Environment Variables**:
   - `VITE_SUPABASE_URL`: `https://your-project.supabase.co`
   - `VITE_SUPABASE_ANON_KEY`: `your-anon-key`
   - `VITE_BACKEND_URL`: The URL generated for the backend service above (e.g., `https://backend-production.up.railway.app`).
4. Generate a domain for your frontend service under **Settings** → **Generate Domain**.

---

## Configuration Summary

The root `package.json` makes it seamless for Railway to identify both apps:
- Build command: `npm run build:frontend`
- Start command: `npm run start:backend`
