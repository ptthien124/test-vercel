-- Create products table
CREATE TABLE products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  stock INTEGER DEFAULT 0,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index for faster queries
CREATE INDEX idx_products_created_at ON products(created_at DESC);

-- Enable Row Level Security (optional - uncomment if needed)
-- ALTER TABLE products ENABLE ROW LEVEL SECURITY;

-- Public read access policy (optional - uncomment if using RLS)
-- CREATE POLICY "Allow public read access" ON products
--   FOR SELECT USING (true);

-- Insert sample products
INSERT INTO products (name, description, price, stock, image_url) VALUES
  ('Wireless Bluetooth Headphones', 'High-quality over-ear headphones with noise cancellation and 30-hour battery life', 149.99, 50, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400'),
  ('Mechanical Keyboard', 'RGB backlit mechanical keyboard with Cherry MX switches', 89.99, 100, 'https://images.unsplash.com/photo-1511467687858-23d96c32e4ae?w=400'),
  ('4K Ultra HD Monitor', '27-inch 4K display with HDR support and USB-C connectivity', 399.99, 25, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400'),
  ('Ergonomic Mouse', 'Wireless ergonomic mouse with adjustable DPI and silent clicks', 49.99, 200, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400'),
  ('USB-C Hub', '7-in-1 USB-C hub with HDMI, SD card reader, and fast charging', 59.99, 150, 'https://images.unsplash.com/photo-1625723044792-44de16ccb4e9?w=400'),
  ('Laptop Stand', 'Adjustable aluminum laptop stand for better ergonomics', 34.99, 75, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400'),
  ('Webcam HD 1080p', 'Full HD webcam with built-in microphone and auto-focus', 79.99, 60, 'https://images.unsplash.com/photo-1587826080692-f439cd0b70da?w=400'),
  ('Desk Lamp LED', 'Adjustable LED desk lamp with multiple brightness levels', 29.99, 120, 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=400');
