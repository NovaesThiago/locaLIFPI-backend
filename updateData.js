import supabase from "./supabaseClient.js";

const { error } = await supabase
  .from("bloco")
  .update({ nome: "Bloco B" })
  .eq("bloco_id", 2)
  .select();

console.log({ error });