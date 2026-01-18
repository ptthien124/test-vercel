import { createClient } from "@/lib/supabase/server";
import { CreateProductInput } from "@/lib/types/product";
import { NextRequest, NextResponse } from "next/server";

export async function GET() {
  const supabase = await createClient();

  const { data, error } = await supabase
    .from("products")
    .select("*")
    .order("created_at", { ascending: false });

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json(data);
}

export async function POST(request: NextRequest) {
  const supabase = await createClient();

  const body: CreateProductInput = await request.json();

  if (!body.name || body.price === undefined) {
    return NextResponse.json(
      { error: "Name and price are required" },
      { status: 400 }
    );
  }

  const { data, error } = await supabase
    .from("products")
    .insert({
      name: body.name,
      description: body.description ?? null,
      price: body.price,
      stock: body.stock ?? 0,
      image_url: body.image_url ?? null,
    })
    .select()
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json(data, { status: 201 });
}
