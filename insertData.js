import supabase from "./supabaseClient.js";

const { error } = await supabase
  .from("bloco")
  .insert({ nome: "Bloco B" })
  .select();

console.log({ error });
