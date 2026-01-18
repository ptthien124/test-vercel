export interface Product {
  id: string;
  name: string;
  description: string | null;
  price: number;
  stock: number;
  image_url: string | null;
  created_at: string;
  updated_at: string;
}

export interface CreateProductInput {
  name: string;
  description?: string | null;
  price: number;
  stock?: number;
  image_url?: string | null;
}

export interface UpdateProductInput {
  name?: string;
  description?: string | null;
  price?: number;
  stock?: number;
  image_url?: string | null;
}
