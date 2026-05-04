# 🚀 Click-to-Deploy Marki to Railway

Marki has been fully optimized for a unified, single-service deployment on Railway. The backend server automatically serves the frontend static build, meaning everything runs on a single domain seamlessly.

---

## Complete Deployment Steps

1. Go to your **Railway Dashboard**.
2. Click **New Project** → **GitHub** → Select your repository.
3. Railway will automatically detect the root `package.json` file.
4. Go to **Settings** → **Environment Variables** and add the following keys:
   - `GROQ_API_KEY`: `your-groq-key-here`
   - `VITE_SUPABASE_URL`: `https://your-project.supabase.co`
   - `VITE_SUPABASE_ANON_KEY`: `your-anon-key-here`
5. Railway will install, build the frontend, and run the backend server under a single instance!
6. Under **Settings**, click **Generate Domain** to get your live deployment link.
