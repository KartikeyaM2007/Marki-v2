-- Create profiles table
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email TEXT,
  full_name TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create brands table
CREATE TABLE IF NOT EXISTS public.brands (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) UNIQUE,
  company_name TEXT,
  industry TEXT,
  website_url TEXT,
  short_description TEXT,
  detailed_description TEXT,
  products TEXT[],
  primary_audience TEXT,
  experience_level TEXT,
  geography TEXT,
  pain_points TEXT[],
  tones TEXT[],
  writing_style TEXT,
  formal_slider INT,
  playful_slider INT,
  detail_slider INT,
  key_themes TEXT[],
  content_goals TEXT[],
  platforms TEXT[],
  design_style TEXT,
  color_preferences TEXT,
  image_vibe TEXT,
  sample_posts TEXT[],
  sample_prompt TEXT,
  website_content TEXT,
  blogs TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create posts table
CREATE TABLE IF NOT EXISTS public.posts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id),
  content TEXT,
  platform TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Users can view their own profile" ON public.profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert their own profile" ON public.profiles FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can view their own brand" ON public.brands FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can update their own brand" ON public.brands FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can insert their own brand" ON public.brands FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can view their own posts" ON public.posts FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert their own posts" ON public.posts FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update their own posts" ON public.posts FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete their own posts" ON public.posts FOR DELETE USING (auth.uid() = user_id);

-- Create a trigger to automatically create a profile for new users
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name)
  VALUES (new.id, new.email, new.raw_user_meta_data->>'full_name');
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
